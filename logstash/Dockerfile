FROM openjdk:11.0-jdk

USER root

RUN mkdir -p /workspace/conf.d && chmod ugo+rwx /workspace && \
cd /workspace && \
wget https://artifacts.elastic.co/downloads/logstash/logstash-7.6.0.tar.gz && \
tar xzvf logstash-7.6.0.tar.gz && rm -f logstash-7.6.0.tar.gz

COPY logstash.yml /workspace/conf.d/logstash.yml
COPY logstash.conf /workspace/conf.d/logstash.conf

WORKDIR /workspace

CMD ["./logstash-7.6.0/bin/logstash", "-f", "/workspace/conf.d/logstash.conf"]
