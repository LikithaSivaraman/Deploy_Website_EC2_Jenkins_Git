# Deploy_Website_EC2_Jenkins_Git

# CI/CD Website Deployment using Jenkins

## Description
Deploy a static website using Jenkins pipeline on an EC2 Ubuntu server with Nginx.

## Architecture
GitHub → Terraform(EC2) → Jenkins → Nginx → Website

## Technologies
- GitHub
- Terraform
- Jenkins
- AWS EC2
- Ubuntu
- Nginx

## Deployment Steps
1. Clone repository
2. Jenkins pipeline runs
3. Files copied to /var/www/html
4. Nginx serves the website

