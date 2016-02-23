FROM ubuntu:trusty

RUN apt-get update ;\
    apt-get install -y curl openjdk-7-jre-headless supervisor ;\
    mkdir /opt/kibana ;\
    curl -o /tmp/kibana4.tar.gz https://download.elastic.co/kibana/kibana/kibana-4.4.1-linux-x64.tar.gz ;\
    tar -C /opt/kibana/ -zxvf /tmp/kibana4.tar.gz  --strip-components=1 ;\
    rm /tmp/kibana4.tar.gz ;\
    useradd kibana ;\
    rm -rf /var/lib/apt/lists/*

ADD start /start
ADD kibana.conf /etc/supervisor/conf.d/kibana.conf
ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf

ENTRYPOINT ["/start"]
EXPOSE 5601
