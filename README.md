# Squid Docker container
Squid in a docker container.  This container is based on Alpine to keep the image size as small as possible.  Out of the box squid is configured to proxy/cache HTTP/S traffic.  If you just need a simple proxy then no further configuration will be necessary; however, most real world situations will require modifications to the out of the box configuration.

## Running the container
To run squid with the out of the box confiruation 

```
docker run -d -p 3128:3128 scbunn/squid:latest
```


### Custom squid configuraiton

```
docker run \
-p 3121:3128 \
-v /my/custom/squid.conf:/etc/squid/squid.conf:ro,Z \
-d scbunn/squid:latest
```

### Caching to disk
The default configruation specifies no disk cache and thus is in-memory only.  If you want to allow disk caching you must pass in a custom configuration file that specifies the cache.  It is recommened you also pass in a volume for persistance.

```
docker run  \
-p 3128:3128 \
-v /my/custom/squid.conf:/etc/squid/squid.conf:ro,Z \
-v /data/cache:/var/cache/squid:Z \
-d scbunn/squid:latest
```


## Logging
The default configruation currently logs inside the container to `/var/log/squid/`.  The default configuration is setup to only log failed attempts.  Successfull attempts are *not* logged with the default config. The following log files are configured by default: `/var/log/access.log`, `/var/log/cache.log`.  The goal is to redirect the access and cache log to stdout and stderr [Issue 5](https://github.com/scbunn/docker-squid/issues/5).

## Default Configuration
The default configuration supports basic HTTP/S.  There are no access controls in place to prevent unwanted hosts from using this proxy.  Any host that is able to connect will be accepted.  The default config will proxy any request to port `80` or port `443`.
