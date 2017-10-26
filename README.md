# cerebro in a Docker (CentOS and Alpine version available)
[![Build Status](https://travis-ci.org/pozgo/docker-cerebro.svg)](https://travis-ci.org/pozgo/docker-cerebro)  
[![GitHub Open Issues](https://img.shields.io/github/issues/pozgo/docker-cerebro.svg)](https://github.com/pozgo/docker-cerebro/issues)  
[![Stars](https://img.shields.io/github/stars/pozgo/docker-cerebro.svg?style=social&label=Stars)]()
[![Fork](https://img.shields.io/github/forks/pozgo/docker-cerebro.svg?style=social&label=Fork)]()  
[![Docker Start](https://img.shields.io/docker/stars/polinux/cerebro.svg)](https://hub.docker.com/r/polinux/cerebro)
[![Docker Pulls](https://img.shields.io/docker/pulls/polinux/cerebro.svg)](https://hub.docker.com/r/polinux/cerebro)
[![Docker Auto](https://img.shields.io/docker/automated/polinux/cerebro.svg)](https://hub.docker.com/r/polinux/cerebro)  
[![](https://img.shields.io/github/release/pozgo/docker-cerebro.svg)](http://microbadger.com/images/polinux/cerebro)

Felling like supporting me in my projects use donate button. Thank You!  
[![](https://img.shields.io/badge/donate-PayPal-blue.svg)](https://www.paypal.me/POzgo)

This is a [Cerebro](https://github.com/lmenezes/cerebro) in docker [polinux/cerebro](https://registry.hub.docker.com/u/polinux/cerebro/) image, for easy deployment of cerebro.

## Environmental Variables
|Variable|Info|
|:----|:----|
|`ES_ADDRESS`|IP or FQDN address of Elasticsearch|
|`ES_PORT`|Port on which Elasticsearch is accessible|
|`ES_NAME`|Name of the cluster that will pop on the list in the web UI|

## Basic Usage
Deploying with below command will allow user to type elasticsearch details through Cerebro web UI instead of using variables when starting image. 

    docker run -d \
      --name cerebro \
      -p 9000:9000 \
      polinux/cerebro 

Go tyou your Docker host IP address in your bnrowser and use port 9000.  

    [http://localhost:9200](http://localhost:9200)

## Usage - wite one pre-configured Elasticsearch server. 

    docker run -d \
      --name cerebro \
      -p 9000:9000 \
      -e ES_ADDRESS="elasticsearch.ip" \
      -e ES_PORT="9200" \
      -e ES_NAME="MY-ELASTIC" \
      polinux/cerebro

## Usage - custom config file
User can use custom config file which need to be placed in `/opt/cerebro/conf/` directory 

    docker run -d \
      --name cerebro \
      -p 9000:9000 \
      -v custom_cerebro.conf:/opt/cerebro/conf/application.conf \
      polinux/cerebro 

## Build

`docker build --tag=polinux/cerebro .`

Docker troubleshooting
======================

Use docker command to see if all required containers are up and running:
```
$ docker ps
```

Check logs of cerebro server container:
```
$ docker logs cerebro
```

Sometimes you might just want to review how things are deployed inside a running
 container, you can do this by executing a _bash shell_ through _docker's
 exec_ command:
```
docker exec -ti cerebro /bin/bash
```

History of an image and size of layers:
```
docker history --no-trunc=true polinux/cerebro-ce | tr -s ' ' | tail -n+2 | awk -F " ago " '{print $2}'
```


## To Do

1. Add LDAP Auth to `bootstrap.sh`

## Author

* Przemyslaw Ozgo (<linux@ozgo.info>)
