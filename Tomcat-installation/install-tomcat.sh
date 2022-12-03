#!/bin/bash
# Use this script to install tomcat in rehat servers
echo delete the failed version of tomcat
sudo rm -rf /opt/tomcat9
echo assign a hostname to your server 
sudo hostname tomcat
# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
cd /opt 
sudo yum install git wget -y
sudo yum install java-1.8.0-openjdk-devel -y
# Download tomcat software and extract it.
sudo yum install wget unzip -y

sudo wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.0.M10/bin/apache-tomcat-9.0.0.M10.tar.gz
sudo tar -xvf apache-tomcat-9.0.0.M10 tar.gz
sudo rm apache-tomcat-9.0.0.M10.tar.gz
sudo mv apache-tomcat-9.0.0.M10 tomcat9
sudo chmod 777 -R /opt/tomcat9
sudo chown ec2-user -R /opt/tomcat9
sh /opt/tomcat9/bin/startup.sh
# create a soft link to start and stop tomcat
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo yum update -y
starttomcat
echo "end on tomcat installation"
#========

#2. Start of tomcat configuration 


#Tomcat server configuration:
find / -name server.xml context.xml
vim /opt/tomcat9/conf/server.xml #for port configuration

#insert openign and closing tag on the part below after 
vi /opt/tomcat9/webapps/manager/META-INF/context.xml
comment out this file part
<!--
 <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
 -->
#
vi /opt/tomcat9/conf/tomcat-user.xml  # to add user

	<user username="landmark" password="admin" roles="manager-gui,admin-gui"/>
	

/opt/tomcat9/conf/context.xml

 vi /opt/tomcat9/webapps/manager/META-INF/context.xml
  
  vi /opt/tomcat9/conf/tomcat-user.xml  # to add user
  
	
	username YourName password=PassWord   roles=manager-gui
	
	
