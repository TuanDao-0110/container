FROM node:16.17.0-bullseye-slim
WORKDIR /usr/src/app

COPY --chown=node:node . .
RUN npm ci
ENV [REDIS_URL=localhost:6378,MONGO_URL=mongodb+srv://fullstack:12345@fullstack.bu2xfaj.mongodb.net/todos]
USER node
CMD [ "npm", "start" ]