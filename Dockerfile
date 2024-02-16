# Use an official Node runtime as a parent image
FROM ubuntu:latest

# Install Hugo
RUN apt-get update && apt-get install -y curl && \
    apt-get install -y npm 
RUN curl -L https://github.com/gohugoio/hugo/releases/download/v0.122.0/hugo_extended_0.122.0_linux-amd64.deb -o hugo.deb
RUN dpkg -i hugo.deb && rm hugo.deb

# Set the working directory in the container
WORKDIR /src

# Copy the local directory files to the container's workspace
COPY . .

# Make port 1313 available to the world outside this container
EXPOSE 1313

# Define environment variable
ENV NODE_ENV=development

# No default CMD needed as commands will be overridden by Makefile actions
