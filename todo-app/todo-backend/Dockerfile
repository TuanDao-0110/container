FROM node:16.17.0-bullseye-slim
WORKDIR /usr/src/app
## if there are no change on package*.json -> this mean that docker can reuse the cache for the npm install step
COPY package*.json ./
RUN npm ci
# 
COPY --chown=node:node . .

ENV NODE_ENV production

## with user: node, we can use it to run your application as low privileges
USER node  

CMD ["npm", "start" ]