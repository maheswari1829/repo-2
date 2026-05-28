#!/bin/bash

yum update -y

cd /opt/

yum install wget unzip java-17-amazon-corretto -y

wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.6.50800.zip
unzip sonarqube-8.9.6.50800.zip

useradd sonar

chown -R sonar:sonar /opt/sonarqube-8.9.6.50800

chmod -R 775 /opt/sonarqube-8.9.6.50800

sudo -u sonar sh /opt/sonarqube-8.9.6.50800/bin/linux-x86-64/sonar.sh start

sleep 20

ss -tulnp | grep 9000

echo "======================================="
echo "SonarQube URL:"
echo "http://<PUBLIC-IP>:9000"
echo ""
echo "Default Username: admin"
echo "Default Password: admin"
