# Squid Docker container
Squid in a docker container.  This container is based on Alpine to keep the image size as small as possible.  Out of the box squid is configured to proxy/cache HTTP/S traffic.  If you just need a simple proxy then no further configuration will be necessary; however, most real world situations will require modifications to the out of the box configuration.

## Running the container
To run squid with the out of the box confiruation 

```
docker run -d -p 3128:3128 scbunn/squid:latest
```

### passing a custom squid configuration

```
docker run -d -p 3121:3128 -v /my/custom/squid.conf:/etc/squid/squid.conf:ro,Z scbunn/squid:latest
```

### Caching to disk
The default configruation specifies no disk cache and thus is in-memory only.  If you want to allow disk caching you must pass in a custom configuration file that specifies the cache.  It is recommened you also pass in a volume for persistance.

```
docker run -d -p 3128:3128 -v /my/custom/squid.conf:/etc/squid/squid.conf:ro,Z -v /data/cache:/var/cache/squid:Z scbunn/squid:latest
```

## Default Configuration [conf/squid.conf]()
The default configuration supports basic HTTP/S.  There are no access controls in place to prevent unwanted hosts from using this proxy.  Any host that is able to connect will be accepted.  The default config will proxy any request to port `80` or port `443`.
