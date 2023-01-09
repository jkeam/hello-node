FROM registry.access.redhat.com/ubi9/nodejs-18-minimal@sha256:a30c08e42ec5a6129f764e95fd7f1c34e2796f9305bcdde6ca1548795b10ff0b

USER root

# Create and change to the app directory.
WORKDIR /opt/app-root

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

# Install production dependencies.
RUN npm install --only=production

# Copy local code to the container image.
COPY . ./

USER 1001

# Run the web service on container startup.
CMD [ "npm", "start" ]
