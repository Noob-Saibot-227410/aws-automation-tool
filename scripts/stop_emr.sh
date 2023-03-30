#!/bin/bash

echo "Digite o identificador do cluster do EMR que deseja parar:"
read cluster_id

aws emr stop-cluster --cluster-id $cluster_id
