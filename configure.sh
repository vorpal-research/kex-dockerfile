#!/bin/bash

pacman -Syy --noconfirm
pacman -S --noconfirm archlinux-keyring
pacman -Su --noconfirm
pacman-db-upgrade

trust extract-compat

# install required packages
pacman -S --noconfirm \
	gcc \
	make \
	binutils \
	wget \
	python \
	jdk8-openjdk \
	maven \
	git	
