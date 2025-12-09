# Vprofile Multi-Tier Microservices Project (Local DevOps Deployment)

## Ì≥å Overview
This project implements the complete Vprofile multi-tier microservices architecture using multiple Linux virtual machines running on a local environment.  
Each microservice runs on its own VM and communicates over a private network.  
This project demonstrates real-world DevOps skills such as service deployment, load balancing, caching, messaging, and database management.

---

## ÌøóÔ∏è Architecture Components

| Hostname | Role | Technology |
|----------|------|------------|
| web01 | Load Balancer | NGINX |
| app01 | Application Server | Tomcat + Maven |
| db01 | Database Server | MariaDB |
| mc01 | Cache Layer | Memcached |
| rmq01 | Messaging Queue | RabbitMQ |

---

## Ì¥ß Tech Stack Used
- Linux (Ubuntu/CentOS)
- NGINX
- Apache Tomcat 10
- Maven Build Tool
- MariaDB SQL Database
- Memcached Cache Server
- RabbitMQ Message Broker
- Systemd Services
- Shell Scripting
- Networking (ping, nc, curl)

---

## Ì∑© Microservice Interactions

web01 (NGINX)
‚Üì Reverse Proxy
app01 (Tomcat Application)
              ‚Üô ‚Üò
mc01 (Memcached) rmq01 (RabbitMQ)
‚Üì
db01 (MariaDB)


---

## Ì∫Ä What This Project Demonstrates

### ‚úî Multi-VM microservices setup
### ‚úî Application build and deployment using Maven
### ‚úî Tomcat service installation & configuration
### ‚úî Database setup and backend connectivity
### ‚úî Caching layer integration using Memcached
### ‚úî Messaging queue configuration using RabbitMQ
### ‚úî NGINX as a load balancer/reverse proxy
### ‚úî Host-to-host connectivity testing
### ‚úî Troubleshooting systemd, services, ports, and permissions

---

## Ì≥ú NGINX Configuration (web01)
Located in:
web01-nginx/vproapp.conf

Configures load balancing and routing to app01.

---

## Ì≥ú Tomcat Setup (app01)
Includes:
- Maven installation
- Application artifact deployment
- Tomcat systemd service
- Environment configuration

Details:
app01-tomcat/app-deployment-steps.md

---

## Ì≥ú MariaDB Setup (db01)
Includes:
- SQL schema import
- User creation
- Testing connectivity

---

## Ì∑™ Connectivity Testing
Example tests performed between VMs:

ping -c 5 app01
ping -c 5 db01
ping -c 5 mc01
ping -c 5 rmq01

nc -vz db01 3306
nc -vz app01 8080
curl http://app01:8080

---

## Ì≥∏ Screenshots
(Place them inside respective folders)
- Tomcat running
- NGINX reverse proxy working
- SQL database connected
- Memcached + RabbitMQ verification

---

## ÌæØ Learning Outcomes
By completing this project, I gained hands-on experience with:

- Multi-tier architecture deployment
- Linux administration & networking
- Configuring caching, messaging, and database layers
- Reverse proxy and load balancer setup
- Troubleshooting service failures, ports, and permissions
- Understanding how microservices interact in real deployments

---

## Ì≥¶ Future Enhancements
- Add Dockerized version of all services
- Deploy architecture using Ansible
- Move entire setup to AWS (EC2-based Vprofile deployment)
- Add CI/CD pipeline for automatic application deployment

---

## Ì±®‚ÄçÌ≤ª Author
Priyadarshan Kondepudi

