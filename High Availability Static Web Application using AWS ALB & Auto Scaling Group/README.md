# High Availability Web Application using AWS ALB & Auto Scaling Group

## 📌 Project Overview
This project demonstrates the design, deployment, and validation of a **highly available and scalable web application** on AWS using an **Application Load Balancer (ALB)** and an **EC2 Auto Scaling Group (ASG)**.

The application runs on **Apache (httpd)** and serves a static **Tooplate website**, which is deployed automatically at instance boot time using **EC2 user-data**.  
Auto scaling behavior is validated by stressing CPU utilization and triggering **CloudWatch alarms** to scale out instances.

This project focuses on **real-world AWS architecture, security group configuration, and scaling validation**, rather than just basic deployment.

---

## 🎯 Objectives
- Deploy a highly available web application across multiple EC2 instances
- Distribute traffic using an Application Load Balancer
- Automatically provision instances using boot-time user-data
- Implement CPU-based auto scaling using CloudWatch alarms
- Validate scaling behavior under high CPU load
- Apply correct ALB-to-EC2 security group routing

---

## 🏗️ Architecture Overview

### 🔹 AWS Services Used
- **EC2** – Web servers running Apache
- **Application Load Balancer (ALB)** – Traffic distribution
- **Auto Scaling Group (ASG)** – Automatic instance scaling
- **Launch Template** – Instance configuration and user-data
- **Target Group** – Health checks and request routing
- **CloudWatch** – Monitoring and scaling alarms
- **Security Groups** – Controlled network access

---

### 🔁 Request Flow
1. User accesses the **ALB DNS name**
2. ALB receives HTTP traffic on port 80
3. ALB forwards traffic to healthy EC2 instances in the target group
4. Apache serves the static website
5. CPU stress increases load
6. CloudWatch alarm triggers ASG scale-out
7. New EC2 instances are launched and registered with ALB

---

## 🧱 Logical Architecture Diagram

Internet
|
Application Load Balancer
|
Target Group
|
Auto Scaling Group
| |
EC2 (AZ-1) EC2 (AZ-2)
| |
Apache Web Server


---

## ⚙️ Instance Boot-Time Automation (User Data)

Each EC2 instance is provisioned automatically at launch using a **user-data script**.

### Boot-Time Actions:
- System update
- Install Apache (`httpd`), `wget`, and `unzip`
- Enable and start Apache service
- Download Tooplate website ZIP
- Extract and deploy content to `/var/www/html`
- Set correct ownership and permissions

This ensures **consistency and repeatability**, which is critical for Auto Scaling environments.

---

## 🔐 Security Group Configuration

### Application Load Balancer (ALB) Security Group
- **Inbound:**
  - HTTP (Port 80) from `0.0.0.0/0`
- **Outbound:**
  - Allowed to EC2 instances on port 80

### EC2 Instance Security Group
- **Inbound:**
  - HTTP (Port 80) **only from ALB security group**
- **Outbound:**
  - All traffic allowed

✅ This setup ensures **secure and controlled traffic flow** from ALB to EC2 instances.

---

## 📈 Auto Scaling Configuration

### Scaling Policy
- **Metric:** Average CPU Utilization
- **Target Value:** 30%
- **Scaling Type:** Target tracking
- **Minimum Capacity:** 1
- **Desired Capacity:** 1
- **Maximum Capacity:** Configured based on testing needs

---

## 🧪 Scaling Validation & Testing
[O
### Test Method
- Installed `stress` utility on EC2 instances
- CPU utilization stressed to **100%**
- Stress maintained for **15 minutes**

### Expected Behavior
- CloudWatch alarm triggers when average CPU exceeds 30%
- Auto Scaling Group launches new EC2 instances
- New instances automatically:
  - Execute user-data
  - Install Apache
  - Deploy website
  - Register with ALB target group

### Result
✅ Auto Scaling triggered successfully on first attempt
✅ New instances registered as **healthy** in ALB target group
✅ Load distributed across multiple instances

---

## 📊 Monitoring & Observability
- CloudWatch metrics used:
  - CPUUtilization
  - Auto Scaling Group activity
- Scaling activity verified through:
  - ASG activity history
  - ALB target group health checks

---

## 📁 Repository Structure

aws-alb-asg-static-webapp/
├── user-data/
│ └── install_httpd_tooplate.sh
├── diagrams/
│ └── architecture.png
├── screenshots/
│ ├── alb-healthy-targets.png
│ ├── website-running.png
│ └── scaling-activity.png
├── README.md
└── RCA.md


---

## 🧠 Key Learnings
- Importance of correct **ALB-to-EC2 security group configuration**
- Boot-time automation is critical for scalable environments
- CloudWatch alarms must align with application behavior
- Auto Scaling validation requires controlled stress testing
- Real-world AWS projects involve both deployment and troubleshooting

---

## 🚀 Future Enhancements
- Infrastructure as Code using Terraform
- HTTPS support using ACM and ALB
- CloudWatch dashboards
- Blue/Green deployments using ASG instance refresh
- Cost optimization using scaling policies

---

## 👤 Author
**Priyadarshan Kondepudi**
AWS Cloud Practitioner | Aspiring DevOps Engineer

