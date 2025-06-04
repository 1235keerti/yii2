# Yii2 Docker Swarm Deployment with Ansible & CI/CD
Overview
This project demonstrates deploying a PHP Yii2 application on an AWS EC2 instance using Docker Swarm with NGINX as a host reverse proxy. The setup is automated with Ansible and integrates a CI/CD pipeline using GitHub Actions to build, push, and deploy Docker images seamlessly.

Setup Instructions
Prerequisites
AWS EC2 instance (Ubuntu 20.04+ recommended)

Docker & Docker Swarm installed (can be automated by Ansible)

NGINX installed on EC2 host as a reverse proxy

GitHub repository with this project and Ansible playbooks

Docker Hub or GitHub Container Registry account for storing Docker images

SSH access to EC2 instance configured with private key
