#!/bin/sh
set -eu
export TERM=xterm
### Magic Starts Here - H. Potter
#
if [[ $ES_ADDRESS != "localhost" || $ES_PORT != "9200" || $ES_NAME != "elasticsearch" ]]; then
  echo "Detected custom settings. Updating Config"
  sed -i 's|# DOCKER {|  {|g' /opt/cerebro/conf/application.conf
  sed -i 's|# DOCKER host = "HOSTNAME:PORT"|    host = "http://'${ES_ADDRESS}':'${ES_PORT}'"|g' /opt/cerebro/conf/application.conf
  sed -i 's|# DOCKER name = "elasticsearch"|    name = "'${ES_NAME}'"|g' /opt/cerebro/conf/application.conf
  sed -i 's|# DOCKER }|  }|g' /opt/cerebro/conf/application.conf
  echo "Elasticsearch settings:  "
  echo "Address: ${ES_ADDRESS}"
  echo "Port: ${ES_PORT}"
  echo "Name: ${ES_NAME}"
  echo "Starting Cerebro..."
fi

/opt/cerebro/bin/cerebro
