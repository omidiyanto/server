FROM node:latest

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install npm packages
RUN npm config set cache /home/node/.npm --global
RUN mkdir "/home/node/.npm"
RUN mkdir "/.npm"
RUN chmod 777 "/home/node/.npm"
RUN chmod 777 "/.npm"
RUN chown -R 1002710000:0 "/.npm"
RUN chown -R 1002710000:0 "/home/node/.npm"
RUN npm install

# Copy application code
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the server
CMD [ "npm", "start" ]
