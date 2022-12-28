#!/bin/bash

set -Eeuo pipefail
set -x

CHAIN_ID=1333
PUBLIC_IP=$(curl -s v4.ident.me)
echo "Host IP: $PUBLIC_IP"

./geth init /etc/genesis.json

./geth \
--config=/etc/geth.toml \
--networkid=$CHAIN_ID \
--nodiscover \
--syncmode=full \
--http \
--http.port=8545 \
--http.addr=0.0.0.0 \
--http.vhosts="*" \
--http.api=engine,eth \
--authrpc.addr=0.0.0.0 \
--authrpc.port=8551 \
--authrpc.vhosts="*" \
--authrpc.jwtsecret=/etc/jwtsecret \
--nat extip:$PUBLIC_IP
