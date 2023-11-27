FROM node:16.17.0-bullseye-slim

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci

COPY --chown=node:node . .

ENV NODE_ENV production

USER node  

CMD [ "npm", "start" ]