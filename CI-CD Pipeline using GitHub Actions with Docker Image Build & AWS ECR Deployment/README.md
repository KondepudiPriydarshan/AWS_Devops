# CI/CD Pipeline using GitHub Actions, Docker, and AWS ECR (VProfile Application)

## Project Overview
This project demonstrates an end-to-end **CI/CD pipeline** implemented using **GitHub Actions**, **Docker (multi-stage build)**, and **AWS Elastic Container Registry (ECR)**.  
The pipeline automates the process of building a Java-based web application, containerizing it using Docker, and securely pushing the final image to AWS ECR.

The source code for the application was cloned from the **VProfile repository by hkhcoder**, and all build and deployment steps were automated using industry-standard DevOps practices.

---

## Source Code
- **Application:** VProfile (Java-based web application)
- **Source Repository:** hkhcoder/vprofile-project
- **Build Tool:** Apache Maven
- **Runtime Server:** Apache Tomcat

---

## Tools & Technologies Used

| Tool | Purpose |
|---|---|
| GitHub | Source code management and version control |
| GitHub Actions | CI pipeline automation |
| YAML | Workflow definition language |
| Docker | Containerization and image creation |
| Maven | Build and dependency management |
| Tomcat | Application runtime server |
| AWS ECR | Secure container image registry |
| AWS IAM | Authentication and access control |
| Linux | Build and execution environment |

---

## Project Workflow (High-Level Flow)

GitHub Code Push
↓
GitHub Actions Workflow (YAML)
↓
Maven Build (Docker Build Stage)
↓
WAR Artifact Generation
↓
Tomcat Runtime Image Creation
↓
Docker Image Build
↓
Authenticate to AWS
↓
Push Image to AWS ECR

yaml
Copy code

---

## Step-by-Step Implementation

### 1. Cloning the Application Source Code
The VProfile application source code was cloned from the public GitHub repository maintained by **hkhcoder**.  
This provided a real-world Java web application to implement CI/CD practices.

**Why this step is important:**
- Uses a realistic, production-style application
- Demonstrates working with external repositories
- Avoids toy or dummy projects

---

### 2. Creating a GitHub Actions Workflow (YAML)
A GitHub Actions workflow file was created under:

.github/workflows/main.yml

yaml
Copy code

The workflow was configured to trigger automatically on code push events.

**Why GitHub Actions was used:**
- Native CI/CD tool integrated with GitHub
- No external CI server required
- Declarative pipeline using YAML
- Ideal replacement for traditional CI tools like Jenkins

---

### 3. Docker Multi-Stage Build Using Maven
A **multi-stage Dockerfile** was created to separate build and runtime concerns.

#### Build Stage (Maven)
- Used a Maven image with JDK 17
- Compiled the application
- Generated a WAR artifact using `mvn clean package`

**Why Maven was used:**
- Industry-standard Java build tool
- Handles dependency resolution
- Ensures repeatable and consistent builds

**Why multi-stage Docker build:**
- Keeps the final image lightweight
- Excludes build tools from runtime image
- Improves security and performance

---

### 4. Running the Application on Tomcat
In the runtime stage:
- A Tomcat base image was used
- Default web applications were removed
- The generated WAR file was deployed as `ROOT.war`

**Why Tomcat was used:**
- Standard Java web application server
- Widely used in enterprise environments
- Supports WAR-based deployments

---

### 5. Docker Image Creation
The final Docker image contained:
- Only the Tomcat server
- The deployed application artifact
- No Maven or source code

**Why Docker was used:**
- Ensures environment consistency
- Eliminates “works on my machine” issues
- Makes deployment portable and scalable

---

### 6. Pushing the Image to AWS ECR
The GitHub Actions workflow was extended to:
- Authenticate with AWS using IAM credentials
- Log in to AWS ECR
- Tag and push the Docker image to ECR

**Why AWS ECR was used:**
- Fully managed container registry
- Secure integration with AWS services
- Required for ECS and Kubernetes deployments

**Why IAM was important:**
- Secure, role-based authentication
- No hardcoded credentials
- Follows AWS security best practices

---

## Key DevOps Concepts Demonstrated

- CI automation using GitHub Actions
- YAML-based pipeline configuration
- Multi-stage Docker builds
- Artifact lifecycle management
- Secure cloud authentication
- Container image registry integration

---

## Project Outcomes

- Automated application build and containerization
- Successfully pushed production-ready Docker image to AWS ECR
- Implemented a reusable CI pipeline
- Gained hands-on experience with modern DevOps tooling

---

## Future Enhancements

- Deploy image from ECR to AWS ECS
- Add automated testing stages
- Integrate SonarQube for code quality checks
- Add Slack notifications for pipeline status

---

## Author
**Priyadarshan Kondepudi**  
Aspiring DevOps Engineer  
