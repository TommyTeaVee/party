FROM node:16-alpine3.16
WORKDIR /usr/src/app
RUN apk --no-cache add git

COPY package*.json ./

RUN npm install
RUN npm run build

COPY . .

ENV NODE_ENV production

EXPOSE 5000

CMD [ "node", "src/server/server.js" ]