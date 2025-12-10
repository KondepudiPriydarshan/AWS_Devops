# Automated VProfile Deployment using Docker & Vagrant

This project deploys the multi-tier VProfile application using Docker containers 
and Vagrant provisioning. The setup automates installation of Docker, creation 
of the docker-compose file, and deployment of multiple interconnected containers.

## Stack
- MariaDB
- Memcached
- RabbitMQ
- Tomcat App Server
- Nginx Web Tier

## Features
- Fully automated provisioning using Vagrant
- Automatic Docker installation and user group configuration
- Auto-generated compose.yml file
- start/stop/cleanup scripts for Docker resources
- Supports container lifecycle management using xargs, awk, and Bash automation

## How to Run
```bash
vagrant up

## How to Stop
bash stop.sh

