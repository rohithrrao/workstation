#!/bin/bash
/usr/bin/docker network create --driver bridge --subnet 192.168.3.0/24 prom-graf

# Prometheus node exporter
/usr/bin/docker stop prom-local-node
/usr/bin/docker rm prom-local-node
/usr/bin/docker pull prom/node-exporter
/usr/bin/docker run -d -p 9100:9100 --network=prom-graf -v /proc:/host/proc:ro -v /sys:/host/sys:ro -v /:/rootfs:ro --name prom-local-node -v /etc/hostname:/etc/host_hostname prom/node-exporter -collector.procfs /host/proc -collector.sysfs /host/sys -collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)" --collector.textfile.directory /etc/node-exporter/ --collectors.enabled=conntrack,diskstats,entropy,filefd,filesystem,loadavg,mdadm,meminfo,netdev,netstat,stat,textfile,time,vmstat,ipvs

# Prometheus
/usr/bin/docker stop prom
/usr/bin/docker rm prom
/usr/bin/docker pull prom/prometheus
/usr/bin/docker run -d -p 9090:9090 --network=prom-graf --name prom -v /opt/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml -v /opt/prometheus/data:/prometheus prom/prometheus

# Grafana
/usr/bin/docker stop grafana
/usr/bin/docker rm grafana
/usr/bin/docker pull grafana/grafana
/usr/bin/docker run -d -p 3000:3000 --network=prom-graf --name grafana -v /opt/grafana/var/lib/grafana:/var/lib/grafana grafana/grafana
