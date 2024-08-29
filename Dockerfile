FROM node:18-slim 

# Install Chromium
RUN apt-get update && apt-get install -y chromium

# Set environment variables for puppeteer-core
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application code
COPY . .

# Command to run the application
CMD ["node", "index.js"]
