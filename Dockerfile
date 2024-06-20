FROM node:lts-alpine as build

WORKDIR /app

COPY * ./
COPY src ./src
COPY tsconfig.json ./

RUN yarn install
RUN yarn build

FROM node:lts-alpine as production

WORKDIR /app

COPY * .
COPY --from=build app/dist ./dist

RUN yarn install --production

CMD ["node", "dist/index.js"]