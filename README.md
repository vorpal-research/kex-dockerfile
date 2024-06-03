# Kex dockerfile
Docker images for [Kex](https://github.com/vorpal-research/kex).

Repository providea an image for running Kex: `abdullin/kex-standalone:$version`, where `$version` is required version of Kex. 

Currently latest release is version `0.0.5`.

## Build

```make
make
```


## Usage

Image is available at [Docker Hub](https://hub.docker.com/repository/docker/abdullin/kex-standalone/general):

```bash
docker pull abdullin/kex-standalone:$version
```

Run Kex on a custom project:
```
docker run -v ~/myproject:/home/myproject -v ~/kex-output:/home/kex-output abdullin/kex-standalone:$version --classpath /home/myproject/target/myproject.jar --target myproject.\* --output /home/kex-output
```
