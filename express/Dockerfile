FROM node:16.17.0-bullseye-slim
WORKDIR /usr/src/app
# copy ALL the files in this directory to image.
# COPY . . 
# RUN npm install
# CMD "npm" "start"

COPY --chown=node:node . .
RUN npm ci 

ENV DEBUG=playground:*

USER node
CMD npm start