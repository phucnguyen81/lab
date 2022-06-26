FROM jenkins/jenkins:lts-jdk11

# Skip initial UI setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Path to custom jenkins config (for the Configuration as Code plugin)
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml

# Initial user
ENV JENKINS_ADMIN_ID admin
ENV JENKINS_ADMIN_PASSWORD admin

# Install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# Configuration-as-code config
COPY casc.yaml /var/jenkins_home/casc.yaml
