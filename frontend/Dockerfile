# Use Node.js 16-alpine as the base image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the application
RUN npm run build

# Install 'serve' to serve the build directory
RUN npm install -g serve

# Command to serve the build directory on port 5000
CMD ["serve", "-s", "dist", "-l", "5000"]

# Expose port 5000 for the app
EXPOSE 5000

