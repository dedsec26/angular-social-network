# Use a lightweight base image
FROM node:18 as build

# Copy package.json and package-lock.json
COPY package.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the Angular application for production
RUN npm run build

# Expose the port the app runs on
EXPOSE 80

# Command to run the Angular application
CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "80"]
