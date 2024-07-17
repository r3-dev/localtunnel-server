FROM node:10.1.0-alpine

WORKDIR /app

COPY package.json /app/
COPY yarn.lock /app/

RUN yarn install --production && yarn cache clean

COPY . /app

ENV NODE_ENV=production
ENV PORT=""
ENV DOMAIN=""
ENV SECURE=""
ENTRYPOINT node -r esm ./bin/server --port ${PORT} --domain ${DOMAIN}
