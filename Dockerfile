# Use the official Jenkins base image
FROM jenkins/jenkins:lts

# Switch to root to install plugins
USER root

# Install required plugins using the Jenkins plugin CLI
RUN jenkins-plugin-cli --plugins unique-id

# (Optional) Switch back to Jenkins user
USER jenkins
