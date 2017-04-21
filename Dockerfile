FROM ubuntu:trusty

RUN apt-get update && \
    apt-get install -y curl supervisor && \
    mkdir /opt/kibana && \
    curl -o /tmp/kibana.tar.gz https://artifacts.elastic.co/downloads/kibana/kibana-5.3.1-linux-x86_64.tar.gz && \
    tar -C /opt/kibana/ -zxvf /tmp/kibana.tar.gz  --strip-components=1 && \
    rm /tmp/kibana.tar.gz && \
    useradd kibana && \
    rm -rf /var/lib/apt/lists/* && \
    chown -R kibana:kibana /opt/kibana/optimize/

ADD start /start
ADD kibana.conf /etc/supervisor/conf.d/kibana.conf
ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf

ENTRYPOINT ["/start"]
EXPOSE 5601
