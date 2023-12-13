# syntax=docker/dockerfile:1
   
FROM node
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
CMD ["node", "src/index.js"]
EXPOSE 3000