#!/bin/bash
# Update and upgrade system
sudo apt update && sudo apt upgrade -y
# Install prerequisites
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Add the Docker APT repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# Update package index
sudo apt update
# Install Docker
sudo apt install -y docker-ce
# Verify Docker installation
sudo systemctl status docker
# Enable Docker service to start on boot
sudo systemctl enable docker
# Install Docker using Docker's convenience script (alternative method)
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
# Verify Docker installation again
sudo systemctl status docker
# Understand Docker Commands
# Pull an image from Docker Hub
sudo docker pull hello-world
# Create and run a container
sudo docker run hello-world
# Display list of running containers
sudo docker ps
# Stop a running container (example: replace <container_id> with actual container ID)
# sudo docker stop <container_id>
# Remove a stopped container (example: replace <container_id> with actual container ID)
# sudo docker rm <container_id>
# List all Docker images
sudo docker images
# Remove an image (example: replace <image_id> with actual image ID)
# sudo docker rmi <image_id>
echo "Docker setup and basic commands execution completed."
