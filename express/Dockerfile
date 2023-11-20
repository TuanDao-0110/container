FROM node:16.17.0-bullseye-slim
WORKDIR /usr/src/app
# copy ALL the files in this directory to image.
COPY . . 
RUN npm install
CMD "npm" "start"