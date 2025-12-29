🚀 End-to-End CI/CD Pipeline for VProfile Application (Jenkins + AWS + Docker)

📌 Project Overview

This project demonstrates a complete enterprise-grade CI/CD pipeline built for the VProfile Java web application, covering the full lifecycle from source code commit to containerized deployment on AWS ECS.

The pipeline is implemented using both Jenkins Freestyle jobs and Declarative Pipelines, showcasing flexibility and real-world DevOps practices. It integrates code quality checks, artifact management, containerization, cloud-native deployment, secure automation triggers, and notifications.

🏗️ Architecture Overview
🔁 CI/CD Flow
Developer
   |
   v
GitHub Repository
   |
   |  (Webhook / Poll SCM / Remote Trigger)
   v
Jenkins CI/CD
   |
   |--> Maven Build & Unit Tests
   |--> Checkstyle Analysis
   |--> SonarQube Code Quality Scan
   |--> Quality Gate Enforcement
   |
   v
Nexus Repository (Verified Artifact)
   |
   v
Docker Image Build
   |
   v
Amazon ECR (Container Registry)
   |
   v
Amazon ECS (Container Deployment)
   |
   v
Application Live

🧰 Tools & Technologies Used
Category	Tools
CI/CD Orchestration	Jenkins (Freestyle + Pipeline)
Source Control	GitHub
Build Tool	Apache Maven
Testing	Maven Unit Tests
Code Quality	Checkstyle, SonarQube
Artifact Repository	Nexus Repository
Containerization	Docker
Cloud Registry	AWS ECR
Container Orchestration	AWS ECS
Notifications	Slack
Automation Triggers	Git Webhook, Poll SCM, API Token + Jenkins Crumb
🔄 Pipeline Stages (Detailed Explanation)
1️⃣ Source Code Management (GitHub)

Application source code is hosted in GitHub

Any change to the repository can automatically trigger the pipeline

Why this is important

Enables version control and collaboration

Acts as the single source of truth for CI/CD

2️⃣ Jenkins Build Triggers (Automation)

The pipeline supports multiple trigger mechanisms:

✔ Git Webhook

Triggers Jenkins immediately on code push
Why: Event-driven, fast feedback loop

✔ Poll SCM

Jenkins periodically checks for changes
Why: Useful when webhook access is restricted

✔ Remote Trigger (API Token + Jenkins Crumb)

Secure remote triggering using:

Jenkins API Token (authentication)

Job Authentication Token (authorization)

CSRF Crumb (security)

Why

Enables automation from scripts, cron jobs, or external systems

Demonstrates secure Jenkins automation

3️⃣ Build & Packaging (Maven)

Maven compiles source code and packages it as a .war file

Why Maven

Standard Java build tool

Ensures consistent, repeatable builds

4️⃣ Unit Testing

Automated unit tests are executed as part of the pipeline

Why

Detects issues early

Prevents faulty code from progressing

5️⃣ Code Quality & Static Analysis
✔ Checkstyle

Enforces Java coding standards
Why: Improves readability and maintainability

✔ SonarQube

Performs deep static code analysis

Measures bugs, vulnerabilities, and technical debt

Why

Ensures production-ready code

Enforces quality gates

6️⃣ Quality Gate Enforcement

Pipeline waits for SonarQube Quality Gate result

Build fails automatically if standards are not met

Why

Prevents poor-quality code from reaching deployment

7️⃣ Artifact Management (Nexus Repository)

Verified .war artifact is uploaded to Nexus

Why

Centralized artifact storage

Supports versioning and rollback

Decouples build and deployment

8️⃣ Docker Image Build

Jenkins builds a Docker image from the verified artifact

Jenkins user is added to the Docker group for secure execution

Why Docker

Consistent runtime environment

Simplifies deployment and scaling

9️⃣ Push to AWS ECR

Docker image is tagged and pushed to Amazon ECR

Why ECR

Secure, AWS-native container registry

Tight integration with ECS

🔟 Deployment to AWS ECS

ECS pulls the image from ECR and deploys the container

Why ECS

Fully managed container orchestration

No server management required

Supports rolling deployments

1️⃣1️⃣ Slack Notifications

Slack notifications are sent for:

Build success

Build failure

Why

Immediate visibility

Faster incident response

Essential for production CI/CD pipelines

🔐 Security & Best Practices

Jenkins API Tokens instead of passwords

CSRF protection using Jenkins Crumbs

IAM-based access control for AWS

Versioned artifacts and Docker images

Separation of CI and CD responsibilities

📈 Key Learning Outcomes

Built a production-style CI/CD pipeline

Understood Jenkins security (API tokens, job tokens, CSRF)

Implemented quality gates and artifact management

Integrated Docker and AWS ECS deployment

Gained real-world troubleshooting experience

🧪 How to Trigger the Pipeline
Git Webhook

Triggered automatically on code push

Remote Trigger (Example)
curl -i -X POST \
-u admin:119dabf8d0c460d084048874710c8e47d6 \
-H "Jenkins-Crumb: cfb6a8ec5a74f4049eba357a7c1a4c152f21df3167b3869e88f494e8f1a85de8" \
"http://13.223.59.185:8080/job/Trigger/build?token=vprofile-trigger-token"

📌 Future Enhancements

Blue/Green or Canary deployments on ECS

Infrastructure as Code using Terraform

GitHub Actions → Jenkins integration

Centralized logging and monitoring

📣 Author

Priyadarshan Kondepudi
DevOps | AWS | CI/CD | Docker | Jenkins

