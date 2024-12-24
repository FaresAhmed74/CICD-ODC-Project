# Simple Web Application Deployment with CI Pipeline

This project demonstrates a complete CI/CD pipeline for deploying a simple Python-based web application. The pipeline is implemented using **Jenkins**, **Docker**, **Vagrant**, and **Ansible**, and automates the build, test, and deployment process across two target machines.

## Table of Contents

1. [Overview](#overview)  
2. [Requirements](#requirements)  
3. [Project Workflow](#project-workflow)  
4. [Setup Instructions](#setup-instructions)  
5. [CI/CD Pipeline Steps](#ci/cd-pipeline-steps)  
6. [Key Files and Directories](#key-files-and-directories)  
7. [Technologies Used](#technologies-used)  
8. [Future Enhancements](#future-enhancements)

---

## Overview

This project automates the deployment of a simple Python web application. The entire deployment process, from building a Docker image to running the application on two Vagrant machines, is orchestrated using a Jenkins pipeline and Ansible playbooks.

---

## Requirements

To replicate this project, ensure you have the following:

- **Python code** (provided in the project repository)
- A **GitHub** private repository to store the project code
- **Docker** for containerization
- **Vagrant** to create and manage virtual machines
- **Jenkins** for automating the CI/CD pipeline
- **Ansible** to configure and deploy the application on target machines

---

## Project Workflow

1. **Push Python Code:** The application code is pushed to a private GitHub repository.  
2. **Containerize Application:** Write a Dockerfile to containerize the application and push the image to Docker Hub.  
3. **Provision Virtual Machines:** Create two low-spec Vagrant machines to host the application.  
4. **Configure Jenkins Pipeline:** Use Jenkins to automate the following steps:  
   - Pull code from GitHub.  
   - Build and push a Docker image.  
   - Use Ansible to set up the target machines, pull the Docker image, and run the application container.

---

## Setup Instructions

### 1. Create a Docker Image
- Write a `Dockerfile` to containerize the application.
- Build the Docker image:
  ```bash
  docker build -t <image_name> .
  ```
- Push the image to Docker Hub:
  ```bash
  docker push <dockerhub_username>/<image_name>
  ```

### 2. Create Vagrant Machines
- Define two virtual machines in a `Vagrantfile`.
- Start the machines:
  ```bash
  vagrant up
  ```

### 3. Set Up Jenkins Pipeline
- Install Jenkins and configure credentials for GitHub and Docker Hub.
- Create a Jenkins pipeline with the following steps:
  1. Clone the GitHub repository.
  2. Build the Docker image.
  3. Push the image to Docker Hub.
  4. Trigger the Ansible playbook.

### 4. Configure Ansible
- Write an Ansible playbook to:
  - Install Docker on the Vagrant machines.
  - Pull the Docker image from Docker Hub.
  - Run the application container.

---

## CI/CD Pipeline Steps

1. **Pull Github-Repo:** The Jenkins pipeline pulls the latest code from the GitHub repository.  
2. **Build Docker Image:** The Dockerfile is used to build the Docker image.  
3. **Push Docker Image:** The Docker image is pushed to a public or private Docker Hub repository.  
4. **Setup Vagrant Machines using Ansible:**  
   - Install Docker on target machines.  
   - Pull the Docker image.  
   - Run the application container.
![Screenshot 2024-12-23 231521](https://github.com/user-attachments/assets/4d6d9263-e12f-4b8b-987e-4fcaef644817)

---

## Key Files and Directories

- `app/`: Contains the Python application code.  
- `Dockerfile`: Instructions to containerize the application.  
- `Vagrantfile`: Defines the configuration for the virtual machines.  
- `Jenkinsfile`: Jenkins pipeline script (if using scripted pipelines).  
- `ansible/`: Directory containing the Ansible playbook and inventory files.  

---

## Technologies Used

- **Python flask**: The web application framework.  
- **Docker**: Containerization platform.  
- **Vagrant**: Virtual machine manager.  
- **Jenkins**: CI/CD automation tool.  
- **Ansible**: Configuration management and application deployment.  

---

## Future Enhancements

- Use Ngrok for hosting the website.
- Add monitoring tools like Prometheus and Grafana to track application health.

---


