FROM node:alpine as builder

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Build folder path /app/build 
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
