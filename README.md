# Group37_Assignment2_Database-CloudSecurity
Step-by-step running the application

# Secure Library Portal Application

A containerized, secure Flask web application built as part of a cloud migration and digital defense deployment strategy. The application tier features automated Transport Layer Security (TLS) encryption and restricted network firewalls to ensure robust data-in-transit protection.

---

##  Architectural Overview
* **Application Tier:** Containerized Flask microservice compiled inside a lightweight Docker container.
* **Data Transit Security:** Data is end-to-end encrypted locally via an ad-hoc SSL context (`pyOpenSSL`) generated inside the container on runtime.
* **Network Security:** Multi-tier perimeter defense isolating administrative entry points (Ports 22 and 1433) while routing authorized web traffic safely.

---

##  Prerequisites
Before running the application, ensure your machine has the following software installed:
* **Docker Desktop** (or Docker Engine via CLI)
* **Python 3.9+** (if running locally outside a container for development)
* Web browser (Chrome, Firefox, or Edge)

---

##  Execution & Deployment Guide

Follow these steps to build, run, and test the secure environment.

### Step 1: Clone the Repository
Navigate to your working directory and clone the project codebase:
```bash
git clone <your-github-repository-url>
cd <your-project-folder>
```

Built a secure Docker image

```bash
docker build -t library-web-app .
```

Spin Up the Containerized Instance
Run the Docker container in detached mode, mapping the internal application service to port 5000 on your host machine:

```bash
docker run -d -p 5000:5000 --name library-app-secure library-web-app
```

