docker-kibana
=============

Container for running [Kibana](https://www.elastic.co/products/kibana).

*Usage:*

* Build: `docker build -t kibana .`
* Run: `docker run -d -p 5601:5601 kibana`

*Extras:*

* Set elasticsearch hostname: `-e ELASTICSEARCH_HOSTNAME="192.168.31.11:9200"`
* Set kibana port: `-e KIBANA_PORT="1234"`
