#!/bin/bash

echo "Digite o identificador da instância EC2 que deseja parar:"
read instance_id

aws ec2 stop-instances --instance-ids $instance_id
