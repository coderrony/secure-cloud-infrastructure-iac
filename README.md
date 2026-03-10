# AWS VPC Infrastructure with Modular EC2 (Terraform IaC)

## 📌 Project Overview
[cite_start]This project focuses on designing and provisioning a secure AWS network infrastructure using **Infrastructure as Code (IaC)** principles[cite: 1]. [cite_start]It features a custom VPC with public and private subnets, controlled access via Security Groups, and a modular EC2 deployment strategy[cite: 2].

[cite_start]The architecture is designed for a startup environment where public-facing resources are accessible from the internet, while internal resources remain private and accessible only through a dedicated **Bastion Host**[cite: 3, 4].

## 🚀 Key Features
* [cite_start]**Custom VPC Design**: A dedicated VPC with isolated Public and Private subnets[cite: 6].
* [cite_start]**Modular Architecture**: EC2 instances (Public, Private, and Bastion) are managed through a reusable Terraform module[cite: 9, 13].
* **Enhanced Security**: 
    * [cite_start]Public-facing resources allow SSH and HTTP access[cite: 8].
    * [cite_start]Private resources allow SSH access **only** from the Public Security Group[cite: 8].
* [cite_start]**Automated Key Management**: Programmatic generation of SSH key pairs with secure local storage of the private key[cite: 5].
* [cite_start]**Reproducible Environment**: The entire stack is automated using Terraform for consistent and reproducible deployments[cite: 4].

## 🏗️ Architecture Components
* [cite_start]**Public Subnet**: Hosts the Public EC2 and the Bastion Host with public IPs[cite: 6, 10].
* [cite_start]**Private Subnet**: Hosts the Private EC2 instance with no direct internet access and no public IP[cite: 7, 10].
* [cite_start]**Internet Gateway**: Attached to the VPC to enable outbound internet access for the public subnet[cite: 7].
* [cite_start]**Route Tables**: Configured to ensure proper traffic routing for both public and private networking[cite: 7].

## 🛠️ Tech Stack
* [cite_start]**Cloud Provider**: AWS [cite: 5]
* **IaC Tool**: Terraform
* [cite_start]**Operating System**: Ubuntu 22.04 LTS [cite: 13]
* [cite_start]**Network**: VPC, Subnets, IGW, Route Tables [cite: 6, 7]

## 📖 How to Deploy

### Prerequisites
1.  [cite_start]**AWS CLI**: Configured with a **Named Profile**[cite: 5].
2.  **Terraform**: Installed on your local machine.

### Steps
1.  **Clone the Repository**:
    ```bash
    git clone [https://github.com/your-username/your-repo-name.git](https://github.com/your-username/your-repo-name.git)
    cd your-repo-name
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
[cite_start]Once the deployment is complete, Terraform will display the following[cite: 10, 11]:
* **Public EC2 Public IP**
* **Bastion Host Public IP**
* **Private EC2 Private IP**
* **Path to the generated SSH Private Key**

## 🛡️ Security: The Bastion Host Approach
[cite_start]The Bastion Host acts as a secure gateway for administrative access[cite: 4]. [cite_start]Since the Private EC2 instance is shielded from the internet and lacks a public IP, users must first SSH into the Bastion Host and then "jump" to the Private instance[cite: 4, 10]. [cite_start]This design ensures that internal resources remain protected from direct external threats while remaining accessible to authorized engineers[cite: 4].

---
*Created by **Rony Das** as part of the AWS DevOps Assignment.*
