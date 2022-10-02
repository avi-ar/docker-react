###stage 1

FROM node:18-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

## /app/build all of the stuff we care about###

FROM nginx:1.23.1-alpine 
COPY --from=builder /app/build /usr/share/nginx/html


