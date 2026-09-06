# syntax=docker/dockerfile:1
# Build context: ./petit-caillou-web
FROM node:22-alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
RUN cat > /etc/nginx/conf.d/default.conf <<'NGINX'
server {
  listen 80;
  server_name _;

  location /api/ {
    proxy_pass http://backend:8080/;
  }

  location / {
    root /usr/share/nginx/html;
    try_files $uri $uri/ /index.html;
  }
}
NGINX
EXPOSE 80
