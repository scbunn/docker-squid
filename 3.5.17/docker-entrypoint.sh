#!/bin/sh
# ----------------------------------------------------------------------------
# entrypoint for squid container
# ----------------------------------------------------------------------------
set -e

SQUID_VERSION=$(/usr/sbin/squid -v | grep Version | awk '{ print $4 }')
if [ "$1" == "squid" ]; then
  echo "Staring squid [${SQUID_VERSION}]"
  chown -R squid:squid /var/cache/squid
  exec /sbin/su-exec root /usr/sbin/squid -N
else
  exec "$@"
fi

