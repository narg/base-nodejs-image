############################################################
# Dockerfile to build NARG NodeJS Image
# Based on NARG Base Image
############################################################

# Set the image
FROM narg/nodejs-docker-image:1.0

WORKDIR /usr/src

# Download and extract NodeJS Source Code v0.12.3
RUN wget http://nodejs.org/dist/v0.12.3/node-v0.12.3.tar.gz
RUN tar xzvf node-v*

# Install NodeJS dependencies
RUN yum install -y gcc gcc-c++

# Clean up YUM
RUN yum clean all

# Install NodeJS
WORKDIR /usr/src/node-v0.12.3
RUN ./configure
RUN make
RUN make install

# Install Global Node Modules
RUN npm install nodemon -g
