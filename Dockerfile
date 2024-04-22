# Use an official Node.js image as the base
FROM node:20

# Set the working directory in the container
WORKDIR /usr/src/app

# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
    && apt-get update \
    && apt-get install -y google-chrome-stable=123.0.6312.124-1

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install -g sitespeed.io

# Copy the script file into the container
COPY test_sitespeed.js .

# Command to run the script
CMD ["sitespeed.io", "test_sitespeed.js", "--multi"]



#TODO figure out how to get chrome to start in Docker contiainer 