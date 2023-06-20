#!/bin/bash

kex-install.sh
cd /home/kex
mvn package
python3 ./kex.py $*
