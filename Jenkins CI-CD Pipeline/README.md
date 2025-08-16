# Jenkins CI/CD Pipeline with Docker, SonarQube, AWS ECR & ECS

This project demonstrates a fully automated CI/CD pipeline using **Jenkins**, **Maven**, **SonarQube**, **Docker**, **AWS ECR**, and **ECS**. It uses a Java-based application built with Maven, performs code quality scanning via SonarQube, generates a Docker image, pushes it to Amazon ECR, and triggers an ECS service update for deployment.

---

## âœ… CI/CD Pipeline Stages (as per Jenkinsfile)

1. **Fetch Code**
   - Pulls source code from the GitHub branch (`docker`) of the project.

2. **Build (Maven)**
   - Runs `mvn clean install -DskipTests`
   - Compiles and packages the application.

3. **Unit Testing**
   - Runs `mvn test` for test cases.

4. **Checkstyle**
   - Executes static code analysis using Checkstyle plugin.

5. **SonarQube Analysis**
   - Code is scanned and analyzed in SonarQube.
   - Requires `Quality Gate` to pass before proceeding.

6. **Quality Gate**
   - Pipeline waits for SonarQube to return a 'Passed' result.

7. **Build Docker Image**
   - Docker image is built using a multistage Dockerfile located in `./Docker-files/app/multistage/`.

8. **Push Docker Image to AWS ECR**
   - Image is tagged with Jenkins `$BUILD_NUMBER` and `latest`.
   - Pushed securely to Amazon Elastic Container Registry.

9. **Remove Local Docker Images**
   - Cleans up images from Jenkins agent to save space.

10. **Deploy to ECS**
    - Triggers AWS CLI command to update the ECS service in the specified cluster.
    - Performs blue/green style rollout (`--force-new-deployment`).

---

## í» ï¸ Technologies & Tools Used

| Tool/Service   | Purpose                              |
|----------------|--------------------------------------|
| Jenkins        | CI/CD orchestration                   |
| Maven          | Build & Testing                        |
| SonarQube      | Code Quality Analysis                 |
| Docker         | Containerization                      |
| AWS ECR        | Container Registry                    |
| AWS ECS        | Container Orchestration / Deployment  |
| GitHub         | Source Code Management                |

---

## í¶¼ï¸ Pipeline Screenshots

> screenshots are located in `/images` folder

- Jenkins Pipeline Success
- SonarQube Quality Gate Passed
- Docker Image pushed to ECR
- ECS Deployment Triggered

---

## íº€ Deployment Cluster Info

| Variable              | Value                              |
|----------------------|------------------------------------|
| AWS ECR Repo URL      | `891249033661.dkr.ecr.us-east-1.amazonaws.com/vprofileappimage` |
| AWS ECS Cluster      | `vprofile1`                         |
| ECS Service Name     | `vprofileapptask-service`           |

---

## âœ… Outcome

By the end of the pipeline, the latest Docker image of the application is running in ECS. This project demonstrates both DevOps skills and cloud-native deployment approach using containerization and AWS services.

---

## í´— Repository Structure


