FROM node:18-alpine as build

WORKDIR /app

COPY . .
RUN npm install
RUN npm run build

FROM node:18-alpine as deploy-node

WORKDIR /app
RUN rm -rf ./*

COPY --from=build /app/package.json .
COPY --from=build /app/build .

RUN npm install --omit=dev
CMD ["node", "index.js"]

FROM node:18-alpine as development

WORKDIR /app

COPY --from=build /app .

CMD ["npm", "run", "dev"]
