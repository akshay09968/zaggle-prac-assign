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

