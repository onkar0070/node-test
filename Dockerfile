FROM node:16.14.0-alpine

# If you're using M1, M2 Mac, try this: 
# FROM  --platform=linux/amd64 node:16.14.0-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the application files
COPY . .

# Install bash and htop using apk (Alpine's package manager)
RUN apk update && apk add --no-cache bash htop

# Expose the port
EXPOSE 3000

# Start the application
CMD [ "node", "app.js" ]

