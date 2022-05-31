FROM abdullin/archlinux-aur:latest
MAINTAINER Azat Abdullin <abdullin@kspt.icc.spbstu.ru>

ENV Z3_VERSION "4.8.12"
ENV JAVA_HOME /lib/jvm/default

# install required packages
WORKDIR /home
RUN pacman -Syu --noconfirm \
	python \
	jdk8-openjdk \
	maven

USER arch-user
WORKDIR /tmp
RUN yay -S --noconfirm \
	boolector-java

USER root
RUN chmod -R a+rwx /home

COPY kex-install.sh /usr/bin
COPY kex-test.sh /usr/bin
RUN chmod a+rwx /usr/bin/kex-install.sh
RUN chmod a+rwx /usr/bin/kex-test.sh

# build z3
USER arch-user
WORKDIR /home
RUN git clone https://github.com/Z3Prover/z3.git
WORKDIR /home/z3
RUN git checkout z3-$Z3_VERSION
RUN python scripts/mk_make.py --java
WORKDIR /home/z3/build
RUN make -j8

# install z3
USER root
WORKDIR /home/z3/build
RUN make install
USER arch-user

# install z3 bindings
WORKDIR /home/z3/build
RUN mvn install:install-file -Dfile=com.microsoft.z3.jar -DgroupId=com.microsoft -DartifactId=z3 -Dversion=$Z3_VERSION -Dpackaging=jar

# prepare for run
USER arch-user
ENTRYPOINT ["kex-test.sh"]
