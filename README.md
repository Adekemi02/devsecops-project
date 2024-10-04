# Simple Web Application

<!-- Back to Top Navigation Anchor -->
<a name="readme-top"></a>

<div align="center">
  <a href="https://github.com/Adekemi02/devsecops-project">
    
  </a>
</div>

---

<div align="center">
  <h1><img src="./static/blog/images/sonarcloud-report2.png" alt="Logo" width="90%" height="40%">
  </h1>
</div>

<div>
  <p align="center">
    <a href="https://github.com/Adekemi02/devsecops-project#readme"><strong>Explore the Docs »</strong></a>
    <br />
    <a href="https://github.com/Adekemi02/devsecops-project/blob/main/static/blog/images/sonarcloud-report2.png">View Demo</a>
    ·
    <a href="https://github.com/Adekemi02/devsecops-project/issues">Report Bug</a>
    ·
    <a href="https://github.com/Adekemi02/devsecops-project/issues">Request Feature</a>
  </p>
</div>

---

<!--- Table of Contents --->

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-simple-web-application">About Simple Web Application</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#features">Features</a></li>    
    <li><a href="#future-features">Future Features</a></li>
    <li><a href="#getting-started">Getting started</a></li>
    <li><a href="#future-plans">Future plans</a></li>
    <li><a href="#sample">Sample</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
  </ol>
  <p align="right"><a href="#readme-top">back to top</a></p>
</details>

---

## About Simple Web Application

The Simple Web Application Flask API is designed to provide a lightweight RESTful API built with Flask. It allows users to perform basic CRUD operations, showcasing the essential features of a modern web application. The API is containerized using Docker for easy deployment and scalability.

---

## Built with

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54) ![Flask](https://img.shields.io/badge/flask-%23000.svg?style=for-the-badge&logo=flask&logoColor=white) and ![MySQL](https://www.mysql.com/)

---

### Containerization

The API was containerized using Docker by creating a `Dockerfile` that defines the environment for the Flask application. The image is built and pushed to Docker Hub, allowing it to be pulled and deployed on any container orchestration platform.

---

### CI/CD Process
The Continuous Integration and Continuous Deployment (CI/CD) process is automated using GitHub Actions. The workflow is defined in 
`.github/workflows/main.yml`
which includes steps for:
- Building the Docker image.
- Running tests using Pytest.
- Pushing the Docker image to Docker Hub.
- Deploying the application to a Kubernetes cluster.

---

### Deployment on Kubernetes

The API is deployed on a Kubernetes cluster using the defined Kubernetes manifests. The deployment includes:
- A `Deployment` for managing the application pods.
- A `Service` for exposing the application.
- Role-Based Access Control (RBAC) with a `Role`, `RoleBinding`, and `ServiceAccount` for managing permissions.
- Security measures such as limiting the permissions of the service account and defining resource limits for the containers.

---

## Requirements

- Docker
- Kubernetes (Minikube or Kind)
- kubectl
- GitHub account for CI/CD

---

## Running the Project Locally

To run the project locally, follow these steps:
1. **Clone the Repository**
  ```bash
  git clone https://github.com/Adekemi02/devsecops-project.git
  cd simple-webapp-flask-master
  ```

2. **Build the Docker Image**
  ```bash
  docker build -t simple-webapp-flask .
  ```

3. **Run the Docker Container**
  ```bash
  docker run -p 5000:80 simple-webapp-flask
  ```

4. **Access the Application Open your web browser and go to http://localhost:5000**

---

### Deployment on Kubernetes
To deploy the API on Kubernetes, follow these steps:
1. **Set Up Your Kubernetes Cluster If you are using KinD (Kubernetes in Docker):**
  ```bash
  kind create cluster
  ```
2. **Apply the Kubernetes Manifests Navigate to the directory containing your Kubernetes**
  ```bash
  kubectl apply -f k8s/deployment.yml
  kubectl apply -f k8s/service.yml
  ```
3. **Access the Application Use kubectl port-forward to access the application**
  ```bash
  kubectl port-forward service/simple-webapp-flask-service 5000:80
  ```
4. Open your web browser and go to http://localhost:5000

---

# GitHub Actions CI/CD Configuration

The CI/CD workflow is defined in the .github/workflows/ci-cd.yml file. This file automates the build, test, and deployment processes. It includes:
- Build Stage: Builds the Docker image and scans it.
- Test Stage: Test the image upon successful build and Pushes the Docker image to Docker Hub.
- Deploy Stage: Deploys the application to Kubernetes.

---

# Security Measures
- Role-Based Access Control (RBAC) is implemented with a Role and RoleBinding to restrict access to Kubernetes resources.
- Resource limits are defined in the Deployment manifest to prevent resource starvation.
- The ServiceAccount is used to minimize the permissions granted to the application.
- Flake was implemented to scan the code for syntax errors
- The code is automatically tested using pytest to check for correctness
- Trivy was implemnted to scan for vulnerabilities

Below are the steps required to get this working on a base linux system.
  
  - **Install all required dependencies**
  - **Install and Configure Web Server**
  - **Start Web Server**
   
## 1. Install all required dependencies
  
  Python and its dependencies
  ```bash
  apt-get install -y python3 python3-setuptools python3-dev build-essential python3-pip default-libmysqlclient-dev
  ```
   
## 2. Install and Configure Web Server

Install Python Flask dependency
```bash
pip3 install flask
pip3 install flask-mysql
```

- Copy `app.py` or download it from a source repository
- Configure database credentials and parameters 

## 3. Start Web Server

Start web server
```bash
FLASK_APP=app.py flask run --host=0.0.0.0
```

## 4. Test

Open a browser and go to URL
```
http://<IP>:5000                            => Welcome
http://<IP>:5000/how%20are%20you            => I am good, how about you?
```
