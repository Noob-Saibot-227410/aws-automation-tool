#!/bin/bash

echo "Digite o identificador da instância RDS que deseja parar:"
read instance_id

aws rds stop-db-instance --db-instance-identifier $instance_id
