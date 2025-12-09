config.vm.provision "shell", inline: <<-SHELL
sudo useradd --home-dir /opt/tomcat --shell /sbin/nologin tomcat
sudo yum install java-17-openjdk -y 
sudo wget -P /tmp https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.49/bin/apache-tomcat-10.1.49.tar.gz
sudo tar -xzvf /tmp/apache-tomcat-10.1.49.tar.gz -C /tmp
sudo cp -r /tmp/apache-tomcat-10.1.49/* /opt/tomcat/
sudo chown -R tomcat:tomcat /opt/tomcat
sudo bash -c 'cat > /etc/systemd/system/tomcat.service << EOF
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking
User=tomcat
Group=tomcat

Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment="JAVA_OPTS=-Djava.security.egd=file:/dev/./urandom"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF'
sudo systemctl daemon-reload
sudo systemctl enable tomcat
sudo systemctl start tomcat
SHELL
