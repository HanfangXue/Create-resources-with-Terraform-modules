#!/bin/bash

# Update package list and upgrade system
sudo apt update -y
sudo apt upgrade -y

# Install Docker prerequisites
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gnupg

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg

# Set up Docker stable repository
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index again
sudo apt update -y

# Install Docker Engine
sudo apt install -y docker-ce

# Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Add the default 'ubuntu' user to the docker group
sudo usermod -aG docker ubuntu

# Run the hello-world container (exits immediately)
sudo docker run hello-world > /var/log/docker-hello.log 2>&1
