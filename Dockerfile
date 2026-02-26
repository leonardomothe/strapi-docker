FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV=production

COPY ./app/package*.json ./

RUN npm install

COPY ./app .

RUN npm run build

EXPOSE 1337

CMD ["node", "node_modules/@strapi/strapi/bin/strapi.js", "start"]
