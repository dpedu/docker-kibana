FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /opt/kibana && \
    wget -qO /tmp/kibana.tar.gz https://artifacts.elastic.co/downloads/kibana/kibana-6.3.2-linux-x86_64.tar.gz && \
    tar -C /opt/kibana/ -zxvf /tmp/kibana.tar.gz  --strip-components=1 && \
    rm /tmp/kibana.tar.gz && \
    useradd kibana && \
    chown -R kibana:kibana /opt/kibana/optimize/ && \
    sed -i -E "s/^(#\s?+)?server.host: .+/server.host: 0.0.0.0/" /opt/kibana/config/kibana.yml

ADD start /start

ENTRYPOINT ["/start"]
EXPOSE 5601
