FROM node:slim AS build

WORKDIR /app

COPY package*.json /app/
RUN npm ci

COPY . /app/
RUN npm run build

FROM nginx

RUN sed -i "/index  index.html index.htm;/a\        try_files \$uri /index.html;" /etc/nginx/conf.d/default.conf

COPY --from=build /app/build/ /usr/share/nginx/html
