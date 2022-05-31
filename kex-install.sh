#!/bin/bash

cd /home/
if [[ ! -d "/home/kex/" ]];
then
	git clone https://github.com/vorpal-research/kex.git
else
	cd /home/kex
	git pull
fi
