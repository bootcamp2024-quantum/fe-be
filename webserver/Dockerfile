FROM node:20.4.0 AS builder

WORKDIR /usr/src/app
COPY ./core-frontend /usr/src/app
RUN npm install && npm run build

FROM nginx:1.25.1
COPY webserver/nginx.conf /etc/nginx/nginx.conf
COPY webserver/default.conf.template /etc/nginx/templates/default.conf.template
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
