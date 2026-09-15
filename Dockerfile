FROM node:20-alpine as build
WORKDIR /myapp
COPY package*.json .
RUN npm install
EXPOSE 3000
COPY . .

FROM node:20-alpine as production
WORKDIR /myapp
USER node
COPY --from=build --chown=node:node /myapp ./
CMD ["npm", "start"]
