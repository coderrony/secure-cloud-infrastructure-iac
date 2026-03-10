# AWS VPC Infrastructure with Modular EC2 (Terraform IaC)

## 📌 Project Overview
This project focuses on designing and provisioning a secure AWS network infrastructure using **Infrastructure as Code (IaC)** principles[cite: 1]. It features a custom VPC with public and private subnets, controlled access via Security Groups, and a modular EC2 deployment strategy.

The architecture is designed for a startup environment where public-facing resources are accessible from the internet, while internal resources remain private and accessible only through a dedicated **Bastion Host**.

## 🚀 Key Features
* **Custom VPC Design**: A dedicated VPC with isolated Public and Private subnets.
* **Modular Architecture**: EC2 instances (Public, Private, and Bastion) are managed through a reusable Terraform module.
* **Enhanced Security**: 
    * Public-facing resources allow SSH and HTTP access.
    * Private resources allow SSH access **only** from the Public Security Group.
* **Automated Key Management**: Programmatic generation of SSH key pairs with secure local storage of the private key.
* **Reproducible Environment**: The entire stack is automated using Terraform for consistent and reproducible deployments.

## 🏗️ Architecture Components
* **Public Subnet**: Hosts the Public EC2 and the Bastion Host with public IPs.
* **Private Subnet**: Hosts the Private EC2 instance with no direct internet access and no public IP.
* **Internet Gateway**: Attached to the VPC to enable outbound internet access for the public subnet.
* **Route Tables**: Configured to ensure proper traffic routing for both public and private networking.

## 🛠️ Tech Stack
* **Cloud Provider**: AWS
* **IaC Tool**: Terraform
* **Operating System**: Ubuntu 22.04 LTS 
* **Network**: VPC, Subnets, IGW, Route Tables 

## 📖 How to Deploy

### Prerequisites
1.  **AWS CLI**: Configured with a **Named Profile**.
2.  **Terraform**: Installed on your local machine.

### Steps
1.  **Clone the Repository**:
    ```bash
    git clone https://github.com/coderrony/secure-cloud-infrastructure-iac.git
    cd secure-cloud-infrastructure-iac
    ```
2.  **Initialize Terraform**:
    ```bash
    terraform init
    ```
3.  **Review and Apply**:
    ```bash
    terraform plan
    terraform apply
    ```

## 📊 Outputs
Once the deployment is complete, Terraform will display the following:
* **Public EC2 Public IP**
* **Bastion Host Public IP**
* **Private EC2 Private IP**
* **Path to the generated SSH Private Key**

## 🛡️ Security: The Bastion Host Approach
The Bastion Host acts as a secure gateway for administrative access. Since the Private EC2 instance is shielded from the internet and lacks a public IP, users must first SSH into the Bastion Host and then "jump" to the Private instance. This design ensures that internal resources remain protected from direct external threats while remaining accessible to authorized engineers.

---
*Created by **Rony Das** as part of the AWS DevOps Assignment.*
