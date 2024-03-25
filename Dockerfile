# Use a Windows-based Node.js image
FROM mcr.microsoft.com/windows/servercore:ltsc2019 AS build
WORKDIR /
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

# Use a Windows-based Nginx image
FROM mcr.microsoft.com/windows/nanoserver:1809 AS final
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Copy built files from build stage
WORKDIR /nginx/html
COPY --from=build /dist/angular-social-network .

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
