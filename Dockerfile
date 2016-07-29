FROM ubuntu:16.04

MAINTAINER Alfredo Bello <skuarch@yahoo.com.mx>

ADD ./sonar.properties ./startup.sh ./sonarqube-5.6.zip /tmp/

## install unzip
RUN apt-get update -y && \
    apt-get install unzip curl -y && \

## install java
    curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "https://edelivery.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-linux-x64.tar.gz" && \
    mkdir /usr/lib/jvm && \
    tar -xf /jdk-8u91-linux-x64.tar.gz && \
    mv /jdk1.8.0_91 /usr/lib/jvm/ && \
    chmod 777 -R /usr/lib/jvm && \
    update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_91/bin/java" 1 && \
    update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_91/bin/javac" 1 && \
    update-alternatives --install "/usr/bin/javah" "javah" "/usr/lib/jvm/jdk1.8.0_91/bin/javah" 1 && \
    JAVA_HOME=/usr/lib/jvm/jdk1.8.0_91 && \
    export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_91 && \
    export PATH=$PATH:/usr/lib/jvm/jdk1.8.0_91/bin/java && \

## install sonar
   curl -O -L "https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-5.6.zip" && \
   #mv /tmp/sonarqube-5.6.zip / && \   
   unzip /sonarqube-5.6.zip && \
   mv /sonarqube-5.6 /opt/ && \  
   rm /opt/sonarqube-5.6/conf/sonar.properties && \
   mv /tmp/sonar.properties /opt/sonarqube-5.6/conf && \
   chmod 777 -R /opt/sonarqube-5.6 && \

## startup script
   mv /tmp/startup.sh / && \
   chmod +x /startup.sh && \

## clean up
   rm -rf /tmp/* && \   
   rm -rf /jdk-8u91-linux-x64.tar.gz && \
   rm -rf /sonarqube-5.6.zip

EXPOSE 9000
VOLUME /opt/sonarqube-5.6

CMD /startup.sh


#curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "https://edelivery.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-linux-x64.tar.gz"
