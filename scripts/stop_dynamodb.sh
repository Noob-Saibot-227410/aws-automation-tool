#!/bin/bash

echo "Digite o nome da tabela do DynamoDB que deseja parar:"
read table_name

aws dynamodb update-table --table-name $table_name --billing-mode PAY_PER_REQUEST