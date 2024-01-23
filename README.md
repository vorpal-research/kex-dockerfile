# Kex dockerfile
Docker images for [Kex](https://github.com/vorpal-research/kex).

Repository contains build for two containers:
* `abdullin/kex-standalone:test` --- image for building Kex and running its tests

* `abdullin/kex-standalone:run` --- image for building and running Kex


## Build

```make
make test # building test image
make run # building run image
```


## Usage

Images are available at [Docker Hub](https://hub.docker.com/repository/docker/abdullin/kex-standalone/general):

```bash
docker pull abdullin/kex-standalone:test
docker pull abdullin/kex-standalone:run
```

Run tests:
```
docker run abdullin/kex-standalone:test
```

Run Kex on a custom project:
```
docker run -v ~/myproject:/home/myproject -v ~/kex-output:/home/kex-output abdullin/kex-standalone:run --classpath /home/myproject/target/myproject.jar --target myproject.\* --output /home/kex-output
```
