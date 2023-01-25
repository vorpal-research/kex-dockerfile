#!/bin/bash

kex-install.sh
cd /home/kex
mvn clean package -Pfull-smt 
cd /
rm -rf /home/kex
