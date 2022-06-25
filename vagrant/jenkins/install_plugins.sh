#!/bin/bash

sudo cp ./jenkins.yaml "${JENKINS_HOME}/jenkins.yaml"
sudo wget -O "${JENKINS_HOME}/jenkins-plugin-manager.jar" https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.12.6/jenkins-plugin-manager-2.12.6.jar
sudo java -jar "${JENKINS_HOME}/jenkins-plugin-manager.jar" --war /usr/share/java/jenkins.war --plugin-file ./plugins.txt --plugin-download-directory "${JENKINS_HOME}/plugins"
sudo service jenkins restart
