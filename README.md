# Deploy_Website_EC2_Jenkins_Git

# CI/CD Website Deployment using Jenkins

## Description
This project demonstrates automated deployment of a static website using Infrastructure as Code and CI/CD pipeline.

## Architecture
GitHub → Terraform(EC2) → Jenkins → Nginx → Website

## Tools & Technologies

☁️ AWS EC2 – Hosting the web server

⚙️ Terraform – Infrastructure provisioning

🔄 Jenkins – CI/CD pipeline automation

📦 Git – Version control

🌐 Nginx – Web server to host the website

## Deployment Steps
1. Clone repository
2. Jenkins pipeline runs
3. Files copied to /var/www/html
4. Nginx serves the website

## Project Structure
```
Project folder
```
terraform
```
main.tf
```
variables.tf
```
terraform.tfvars
```

