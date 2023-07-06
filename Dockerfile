# Base image
FROM node:14
# Set the working directory inside the container
WORKDIR /app
# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./
# Install dependencies
RUN npm install
# Copy the application code to the working directory
COPY . .
# Start the application
CMD ["npm", "start"]


# Stage 1: Build Angular app
FROM node:14 as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the Angular app using NGINX
FROM nginx:alpine as production-stage
COPY --from=build-stage /app/dist/my-angular-app /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

