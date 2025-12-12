Ì∫Ä Automated Multi-VM Web Server Deployment Using Bash & SSH

This project automates the provisioning and deployment of websites across multiple Linux VMs using Bash scripting, SSH key-based authentication, and Apache/HTTPD web servers.

Ì¥ß Technologies Used

Bash scripting

SSH & SCP

Apache2 / HTTPD

wget & unzip

Key-based authentication

Linux (CentOS/Ubuntu)

Ì≥å Project Workflow

Provisioning scripts install required packages on each VM:

wget, unzip, httpd/apache2

SSH key pair generated on ScriptBox using:

ssh-keygen -t rsa -b 4096


Public key pushed to all VMs:

ssh-copy-id user@vm-ip


Automated deployment scripts copied to VMs using:

scp deploy_site.sh user@vm-ip:/tmp


Scripts executed remotely via SSH:

ssh user@vm-ip "bash /tmp/deploy_site.sh"


Website successfully deployed on multiple VMs from a single ScriptBox.

Ì≥Å Repository Structure
provisioning/      ‚Üí Scripts to install packages & configure Apache  
automation-scripts/‚Üí Scripts to deploy the website on all VMs  
keys/              ‚Üí .gitignore for SSH keys  
README.md          ‚Üí Project documentation  

Ì∂•Ô∏è Key Features

‚úî Zero manual login after initial key setup
‚úî Remote execution of scripts (push ‚Üí execute ‚Üí deploy)
‚úî Automated Apache installation & website deployment
‚úî Reusable automation for any number of VMs
‚úî Clean Bash functions + error handling

ÌøÅ How to Run

Clone the repo:

git clone <your-repo-url>
cd Automated-WebServer-Deployment-Bash


Update VM IPs in push_to_vms.sh

Run:

bash push_to_vms.sh


Ì±§ Author

Priyadarshan Kondepudi
AWS | DevOps | Bash | Automation
