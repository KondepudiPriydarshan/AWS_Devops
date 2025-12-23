# Highly Available Web Application Deployment on AWS Elastic Beanstalk

## Project Overview
This project demonstrates the deployment of a Java-based web application on AWS Elastic Beanstalk using a highly available and secure architecture. The application integrates multiple AWS managed services including Amazon RDS, ElastiCache, and Amazon MQ, with artifact-based deployments from Amazon S3.

## Architecture Components

### Compute & Application Layer
- AWS Elastic Beanstalk (Tomcat)
- Application Load Balancer (ALB)
- Auto Scaling Group (Minimum 2 instances)
- Session stickiness enabled

### Backend Services
- Amazon RDS (MySQL)
- Amazon ElastiCache
- Amazon MQ (RabbitMQ)

### Deployment & Storage
- Amazon S3 for application artifacts
- Rolling deployment strategy
- AWS CLI for artifact upload

### Content Delivery
- AWS CloudFront

---

## Deployment Workflow

1. Built application artifact (WAR file) locally
2. Uploaded artifact to Amazon S3 using AWS CLI
3. Created Elastic Beanstalk application version from S3
4. Deployed application using rolling deployment strategy
5. Configured load balancer and auto scaling
6. Verified application availability and backend connectivity

---

## Security Design

- Backend services placed in a separate security group
- Inbound access allowed **only from Elastic Beanstalk security group**
- No public access to database, cache, or message broker
- Application communicates with backend services using internal AWS networking

---

## Database Setup

- Amazon RDS (MySQL) used as the relational database
- Database schema loaded manually using MySQL CLI
- Application properties configured with RDS endpoint

---

## Validation & Testing

- Verified application access via ALB DNS
- Confirmed session persistence with stickiness enabled
- Validated database connectivity and data retrieval
- Tested cache and message queue integration through application flows
- Monitored environment health via Elastic Beanstalk console

---

## Tools & Technologies

- AWS Elastic Beanstalk
- Application Load Balancer
- Auto Scaling
- Amazon S3
- Amazon RDS (MySQL)
- Amazon ElastiCache
- Amazon MQ
- Amazon CloudFront
- AWS CLI
- Java
- MySQL
- Linux

---

## Key Learnings

- Deploying scalable applications using AWS managed services
- Implementing secure backend isolation using security groups
- Artifact-based deployments using Amazon S3
- Rolling deployments with zero downtime
- Practical troubleshooting of Elastic Beanstalk environments

