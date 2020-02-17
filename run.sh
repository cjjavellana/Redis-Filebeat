#!/bin/bash

ln -s /workspace/filebeat-7.6.0-linux-x86_64 filebeat
cd /workspace

# Start Redis 
./redis-stable/src/redis-server redis-stable/redis.conf &

# Starting Filebeat - This will be our foreground process
cd filebeat
./filebeat setup --pipelines --modules redis
./filebeat modules enable redis
./filebeat -e -c filebeat.yml
