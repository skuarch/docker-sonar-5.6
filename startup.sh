#!/bin/bash 

JAVA_HOME=/usr/lib/jvm/jdk1.8.0_91
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_91

cd /opt/sonarqube-5.6.1/bin
/opt/sonarqube-5.6.1/bin/linux-x86-64/sonar.sh start
tail -100f /var/log/dmesg