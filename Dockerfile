FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# Install dependencies - Note this includes devDependencies as we compile the app in future steps.
# This is NOT the production ready way to do this, the app should be built and then copied to the production container.
# However, as this is a simple test app lets make life easier & just build & run the app in the same container.
RUN npm ci

# Copy the source code to the container
COPY . .

# Build the app (It's worth mentioning again, that this build step should not really be run in the production container, but for our testing case it is fine)
RUN npm run build

# Run the app
CMD [ "node", "dist/server.js"]