#!/bin/bash

if [ ! -f /data/mumble-server.ini ]
then
  sed -i 's/var.log.mumble-server/data/' /etc/mumble-server.ini
  sed -i 's/var.lib.mumble-server/data/' /etc/mumble-server.ini
  cp /etc/mumble-server.ini /data
  chmod a+rw /data/mumble-server.ini
  echo Created /data/mumble-server.ini. Exiting.
  exit 1
fi

chown -R mumble-server /data
/usr/sbin/murmurd -ini /data/mumble-server.ini -fg -v