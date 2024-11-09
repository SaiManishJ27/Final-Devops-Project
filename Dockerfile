# Use the official Node.js image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json first to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Build the React app for production
RUN npm run build

# Serve the app using the serve package
RUN npm install -g serve

# Expose port 5000 (default for serve)
EXPOSE 5000

# Command to run the app
CMD ["serve", "-s", "build", "-l", "5000"]

