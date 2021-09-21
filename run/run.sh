#!/usr/bin/env bash
source config.txt
cp webadmin.html.template webadmin.html
sed -i "s/IPADDR/$IPADDR/g" webadmin.html
docker run -dit --rm \
    --name rsc \
    -p $IPADDR:514:514/udp \
    -p $IPADDR:443:443 \
    -p $IPADDR:80:80 \
    -v rsc:/opt/rsc/ \
    -e TZ=$TZ \
    --cap-add=NET_ADMIN \
    toddwint/rsc:0.01
