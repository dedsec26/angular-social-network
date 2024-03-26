FROM node:18 as build
RUN mkdir /angular-social-network
WORKDIR /angular-social-network
RUN npm install -g @angular/cli
COPY . .
RUN npm install
RUN npm run build
FROM nginx:alpine
COPY /dist/angular-social-network /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]