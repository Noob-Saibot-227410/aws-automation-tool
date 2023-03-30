#!/bin/bash

echo "Digite o identificador do cluster do Redshift que deseja parar:"
read cluster_id

aws redshift pause-cluster --cluster-identifier $cluster_id
