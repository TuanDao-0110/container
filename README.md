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
```bash
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
```bash
 $ docker container run -it ubuntu bash
```
- 2. when container not running, we have to run it manually and access to shell a docker container using: 

```bash
docker ps -a
docker container start [CONTAINER ID]
docker exec -it [CONTAINER ID] bash
or docker start -i [CONTAINER ID | NAME]
```
`-it` or `-i` to make sure that we can interact with the container. 

- 3. quit: 

```bash
exit
```
- 4. checking is that `Docker` which docker still running: 

```bash
docker ps or docker ps -a
```

- 5. stop `Docker` running by using: 

```bash
docker container stop [CONTAINER ID]
```

- 6. on `Docker container shell` may dont have all required models. So can install it mannually

```bash
apt-get update
apt-get install vim
```
or in `Dockerfile`

```Dockerfile
FROM  confluent/postgres-bw:0.1

RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "vim"]
```
- 7. we can try other commands that ubuntu image might be able to execute

```bash
docker container run --rm ubuntu ls
```
with the `ls` command will list all of the files in the directory and the `--rm` flag will remove the container after execution


### `3. Install node packages:`

- 1. Install node packages on ubuntu container shell interface: 

```bash
curl -sL https://deb.nodesource.com/setup_16.x | bash
apt install -y nodejs
```
- 2. now we have node model on our container then we can run `node`

```bash
node index.js
```


### `4. Start create new docker image from container: `

- 1. we can now create docker image from container we which already many installed `models` and `folder/file`


```bash
docker commit [CONTAINER-NAME|ID] [NEW-IMAGE-NAME]
```

- 2. we can now have a new image. Then we can run it docker container image:

```bash
docker run -it [NEW-IMAGE-NAME] bash
root@4d1b322e1aff:/# node /usr/src/app/index.js
```

- 3. we can set up the name for container: 

```bash
docker container run -it --name [CONTAINER-NAME] [image] bash
```

- 4. or, in this case we want to run `node` model on our container shell interface, we can use `Node image` from "hub.docker.com":

```bash
docker container run -it --name [CONTAINER] node:16 bash
```

- 5. Copy file from local machine to container, when we already have this `file` on our local machine:

```bash
docker container cp ./index.js [CONTAINER-NAME]:/usr/.../index.js
```



# B. Building and Configuring environmens: 

### `1. Dockerfile:`
- we can create new image that contains the "hello, world" application. The tool for this is `Dockerfile`
- `Dockerfile` is simple text that contains all the instruction for creating a image. 
- Example for folder structure: 

```
├── index.js
└── Dockerfile
```

- Dockerfile example:

```Dockerfile
FROM node:16

WORKDIR /usr/src/app

COPY ./index.js ./index.js

CMD node index.js
```

- `docker build` command to build an image based on the `Dockerfile`:

```bash
docker build -t fs-hello-world .
```
   - flag`-t` will help to name the image
   - with `.` a simple dot will mean the `Dockerfile` in this directory.


### `2. .dockerignore:`

- we may accidentally move non-functional parts to the image with `COPY` instructions. --> this can be easily happen if we copy the `node_modules` directory into the image.

- the easiest way to do is only copy files that you would push to `Github`

- `.dockerignore` will solve the problem:

```bash
.dockerignore
.gitignore
node_modules
Dockerfile
```

### `3. Docker with express server:`
- create full express server template: 
```bash
$ npx express-generator
```
- set up docker build: 
- run the docker image and define the port: 

```bash
$ docker run -p 3123:3000 express-server
```

- The `-p` flag will inform Docker that a port form the host machine should be opened and directed to a port in the container

- Kill the container in case we dont use it: 

```bash
docker kill [CONTAINER-NAME]
```
- run the container again

```bash
docker start -i [CONTAINER-NAME]
```

### `4.Dockerfile best practices`


- try to create as secure of an image as possible

- try to create as small of a image as possible