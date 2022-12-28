#!/bin/bash

set -Eeuo pipefail
set -x

PEER=enr:-MK4QIDB8RKkJPMjPfFGmNNpSsLvqFXrxtkOiDh9D3_Qv0ExD1ZjNatqe6cUmBL3xHOk5zLyea5wnBCmXP6B7nC_CIOGAYVFFUJzh2F0dG5ldHOIAAAAAAAAAACEZXRoMpA3FbaXIAAAk___________gmlkgnY0gmlwhCPhDNyJc2VjcDI1NmsxoQKaVRuwre2IM4Zyv5IKwZEYX1oFJQCxjJFqLB-qgc0PBYhzeW5jbmV0cwCDdGNwgjLIg3VkcIIu4A
PUBLIC_IP=$(curl -s v4.ident.me)
echo "Host IP: $PUBLIC_IP"

sleep 5

./beacon-chain \
--accept-terms-of-use \
--genesis-state=/etc/genesis.ssz \
--chain-config-file=/etc/config.yml \
--subscribe-all-subnets \
--bootstrap-node= \
--rpc-host 0.0.0.0 \
--rpc-port 4000 \
--grpc-gateway-host 0.0.0.0 \
--grpc-gateway-port 3500 \
--enable-debug-rpc-endpoints \
--min-sync-peers=1 \
--execution-endpoint=$EXECUTION_ENDPOINT \
--jwt-secret=/etc/jwtsecret \
--p2p-host-ip=$PUBLIC_IP \
--peer=$PEER \
--verbosity=debug
