# Automated Tomcat Server Deployment on CentOS using Bash Provisioning Script

## Ì≥å Project Overview
This project automates the installation and configuration of Apache Tomcat on CentOS using a Bash provisioning script.  
It handles downloading Tomcat, extracting files to the correct directory, setting permissions, creating a systemd service, and starting Tomcat automatically.

This is a hands-on DevOps project demonstrating Linux automation, system administration, service management, and troubleshooting.

---

## Ì∫Ä Features
- Installs OpenJDK automatically
- Downloads Apache Tomcat using wget
- Extracts Tomcat to /opt/tomcat using tar
- Creates a dedicated `tomcat` user and group
- Configures permissions for secure access
- Creates a fully functional `systemd` service
- Starts and enables Tomcat on system boot
- Includes debugging fixes for systemd exit status 203

---

## Ìª†Ô∏è Tech Stack
- Bash / Shell Scripting  
- CentOS 7/8  
- Apache Tomcat 10  
- systemd  
- wget, tar, chmod, chown  

