#!/bin/bash

k() {
  kubectl "$@"
}

k delete namespace mysql
k create namespace mysql

k apply -n mysql -f mysql-storage.yaml
k apply -n mysql -f mysql.yaml

