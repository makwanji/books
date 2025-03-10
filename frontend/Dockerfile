# Step 1: Build the React app
FROM node:18 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY . .

# Build the React app
RUN npm run build

# Step 2: Set up Nginx to serve the React app
FROM nginx:alpine

# Copy the build folder from the build stage to the Nginx html directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to access the frontend
EXPOSE 8080

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
