#!/bin/bash

echo "Digite o nome do cluster do Elasticache que deseja parar:"
read cluster_name

aws elasticache stop-cache-cluster --cache-cluster-id $cluster_name
