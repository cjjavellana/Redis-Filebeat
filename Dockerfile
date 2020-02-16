FROM centos:latest

USER root

RUN yum install -y wget make gcc && \
mkdir /workspace && chmod ugo+rwx /workspace && cd /workspace && \
wget http://download.redis.io/releases/redis-stable.tar.gz && \
tar xzvf redis-stable.tar.gz && cd redis-stable && \
make

RUN mkdir -p /workspace/logs && \
cd /workspace/redis-stable && \
sed -i -e 's/^bind 127\.0\.0\.1$/bind 0.0.0.0/g' -e 's/logfile ""/logfile \/workspace\/logs\/redis/g' redis.conf

RUN cd /workspace && \
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.0-linux-x86_64.tar.gz && \
tar xzvf filebeat-7.6.0-linux-x86_64.tar.gz

COPY filebeat.yml /workspace/filebeat-7.6.0-linux-x86_64/
COPY run.sh /workspace

RUN chmod ugo+x /workspace/run.sh && \
rm -f /workspace/redis-stable.tar.gz /workspace/filebeat-7.6.0-linux-x86_64.tar.gz 

WORKDIR /workspace

CMD ["./run.sh"]

