# A. Containers:

### `1. Introduction`

- Containers encapsulate application into a single package. 
- Containers prevent application inside from accessing files and resources of the device. 
- As Containers are relatively lightweight, at least compared to virtual machines, they can be quick to scale. 
- AWS, Google Cloud and Azure all support containers in multiple diffrent forms. 

### `2. Containers and Images:`

- `Containers` is runtime instance of an image.
    - `Images` include all of the code, dependencies and instructions on how to run the application. 
    - `Containers` packages software into standardized units. 
- Run `image` hello-world. 
```
$ docker container run hello-world
```
- Our application may not have image `hello-world:lastest` yest. So docker will automatically pull `image` name: "hello-world".
- Some `Docker CLI:`
```
docker image
docker container run
```
- Image name consist of multiple parts:
```
1. Unable to find image 'hello-world:latest' locally
2. latest: Pulling from library/hello-world
3. b8dfde127a29: Pull complete
4. Digest: sha256:5122f6204b6a3596e048758cabba3c46b1c937a46b5be6225b835d091b90e46c
5. Status: Downloaded newer image for hello-world:latest
```
- The 3rd row and 5th row show the status.
- The 4th row is `unique digest` based on the layers from which teh image is built. 
#### `The result`: 
```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker container run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```
- 1. try with: 
```
 $ docker container run -it ubuntu bash
```
- 2. when container not running, we have to run it manually and access to shell a docker container using: 

```
docker ps -a
docker container start [CONTAINER ID]
docker exec -it [CONTAINER ID] bash
```
- 3. quit: 

```
exit
```
- 4. checking is that `Docker` which docker still running: 

```
docker ps or docker ps -a
```

- 5. stop `Docker` running by using: 

```
docker container stop [CONTAINER ID]
```

- 6. on `Docker container shell` may dont have all required models. So can install it mannually

```
apt-get update
apt-get install vim
```
or in `Dockerfile`

```Dockerfile
FROM  confluent/postgres-bw:0.1

RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "vim"]
```


