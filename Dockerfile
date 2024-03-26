FROM node:alpine as build
WORKDIR /
RUN npm install -g @angular/cli
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build
FROM nginx:alpine
COPY --from=build /dist/angular-social-network /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
