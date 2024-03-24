FROM nginx:alpine

# Create a directory to copy build artifacts
WORKDIR /usr/share/nginx/html

# Copy build artifacts from the drop location to the container
COPY ./angular-artifacts /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
