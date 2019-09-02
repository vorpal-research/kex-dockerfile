#!/bin/bash

# download, compile and install Z3
Z3_DIR="$(mktemp -d)"
cd "$Z3_DIR"

wget -qO- https://github.com/Z3Prover/z3/archive/z3-${Z3_VERSION}.tar.gz | tar xz --strip-components=1

python scripts/mk_make.py --java
cd build
make
make install
mvn install:install-file -Dfile=com.microsoft.z3.jar -DgroupId=com.microsoft -DartifactId=z3 -Dversion=4.7.1 -Dpackaging=jar
cd /
rm -rf "$Z3_DIR"

# download and build Kex
cd /home
git clone https://github.com/vorpal-research/kex.git
cd /home/kex
git submodule init
git submodule update
mvn clean verify
