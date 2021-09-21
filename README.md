# toddwint/rsc

## Info

<https://hub.docker.com/r/toddwint/rsc>

<https://github.com/toddwint/rsc>

Remote Syslog Classic docker image for simple lab syslog testing.

This image was created for lab setups where the need to verify syslog messages are being sent to a customer owned syslog.

## Sample `config.txt` file

```
TZ=UTC
IPADDR=10.1.233.249
```

## Sample docker run command

```
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
```

## Sample webadmin.html.template file

See my github page (referenced above).


## Default username and password

- username: admin
- password: admin

## Login page

`http://localhost`

or the IP you set

or use the `webadmin.html` page
