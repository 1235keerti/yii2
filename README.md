# Yii2 Docker Swarm Deployment with Ansible & CI/CD

# Overview

This project demonstrates deploying a PHP Yii2 application on an AWS EC2 instance using Docker Swarm with NGINX as a host reverse proxy. The setup is automated with Ansible and integrates a CI/CD pipeline using GitHub Actions to build, push, and deploy Docker images seamlessly.

# Setup Instructions

**Prerequisites**

AWS EC2 instance (Ubuntu 20.04+ recommended)

Docker & Docker Swarm installed (can be automated by Ansible)

NGINX installed on EC2 host as a reverse proxy

GitHub repository with this project and Ansible playbooks

Docker Hub or GitHub Container Registry account for storing Docker images

SSH access to EC2 instance configured with private key

**Initial Setup (Manual or via Ansible)**

Clone this repo to your local machine or EC2 instance.

Run Ansible playbook to install dependencies, initialize Docker Swarm, and configure NGINX:


`ansible-playbook -i inventory playbook.yml --extra-vars "image_tag=admin807/yii2app:latest"`


(If running on EC2 directly, use -i localhost, --connection=local)

Ensure NGINX config points to your Docker Swarm service port (default: 9000).

# CI/CD Pipeline

On every push to the main branch:

GitHub Actions builds the Docker image with the commit SHA tag.

Pushes the image to Docker Hub.

SSH into the EC2 instance.

Runs the Ansible playbook to update or deploy the Docker Swarm service with the new image tag.

# Assumptions

EC2 instance has internet access to pull Docker images.

NGINX is running on the EC2 host, configured as a reverse proxy to the Docker Swarm service.

The Ansible playbook is located on the EC2 instance under /home/ubuntu/yii2-deploy/ansible (or adjusted accordingly).

SSH keys and secrets for GitHub Actions are properly set up.

The Docker image repository is public or credentials for private repos are handled.

# How to Test Deployment
**Manual Test-
SSH into EC2:**

`ssh -i <your_key.pem> ubuntu@<ec2_ip>`

**Check Docker Swarm service status:**

`docker service ls`

**Check logs of the running container:**

`docker service logs yii2app_yii2-app`

Curl or open the public URL that points to NGINX (configured port 80), and you should see the Yii2 app running.

# CI/CD Test:

Push a commit to the main branch on GitHub.

Monitor the GitHub Actions workflow for success.

Once complete, visit the application URL to confirm deployment.
`http://13.50.4.156/`











