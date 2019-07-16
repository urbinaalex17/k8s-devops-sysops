#!/bin/bash
sudo curl -O https://releases.hashicorp.com/terraform/0.12.4/terraform_0.12.4_linux_amd64.zip
sudo unzip terraform_0.12.4_linux_amd64.zip -d /usr/local/bin/ 
terraform --version
