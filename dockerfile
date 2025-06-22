# Use Node.js base image
FROM node:16

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Install dependencies
RUN npm install -g bower && \
    npm install && \
    bower install --allow-root

# Expose port (your server uses port 80)
EXPOSE 80

# Start the app
CMD ["node", "server/index.js"]
