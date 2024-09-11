# Use an official base image that supports multi-architecture
FROM --platform=$BUILDPLATFORM node:16-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Specify the entry point
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
