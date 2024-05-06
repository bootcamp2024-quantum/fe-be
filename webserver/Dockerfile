FROM node:20-alpine AS builder

ARG VITE_BACKEND_URL
ENV VITE_BACKEND_URL=${VITE_BACKEND_URL}

WORKDIR /code
COPY ./core-frontend /code
RUN npm install && npm run build

FROM nginx:1.25.1
COPY webserver/nginx.conf /etc/nginx/nginx.conf
COPY webserver/default.conf.template /etc/nginx/templates/default.conf.template
COPY --from=builder /code/dist /usr/share/nginx/html
