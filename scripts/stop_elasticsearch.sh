#!/bin/bash

echo "Digite o nome do domínio do Elasticsearch que deseja parar:"
read domain_name

aws es stop-elasticsearch-domain --domain-name $domain_name
