

#!/bin/bash

# Check the OS type to install Docker
if [ -f /etc/os-release ]; then
  . /etc/os-release
  OS=$ID
elif [ -f /etc/redhat-release ]; then
  OS=`cat /etc/redhat-release | awk '{print $1}' | tr '[:upper:]' '[:lower:]'`
else
  echo "Unable to determine the OS type."
  exit 1
fi

# Install Docker on Ubuntu
if [ "$OS" == "ubuntu" ]; then
  sudo apt update
  sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt update
  sudo apt install -y docker-ce

# Install Docker on Linux
elif [ "$OS" == "linux" ]; then
  sudo yum update
  sudo yum install -y yum-utils device-mapper-persistent-data lvm2
  sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
  sudo yum install -y docker-ce

# Error if the OS type is not supported
else
  echo "This script only supports Ubuntu or Linux."
  exit 1
fi

# Start Docker service and enable it to start at boot time
sudo systemctl start docker
sudo systemctl enable docker

# Add the current user to the docker group
sudo usermod -aG docker $USER

# Verify the installation
docker version



docker build -t prefecthq/prefect:2-latest . && docker run -d --name my-container prefecthq/prefect:2-latest && docker exec -it my-container /bin/bash -c "sh -c 'chmod +x /setup_run_prefect_ec2_Agent_bash.sh && sh /setup_run_prefect_ec2_Agent_bash.sh'"
