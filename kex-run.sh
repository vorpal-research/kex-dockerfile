#!/bin/bash

kex-install.sh
cd /home/kex
mvn package
./kex.sh $*
