# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Set the environment variable for Tomcat
ENV CATALINA_HOME=/opt/apache-tomcat-9.0.97
ENV PATH=$CATALINA_HOME/bin:$PATH

# Install default JDK and clean up after installation
RUN apt-get update && apt-get install -y default-jdk && apt-get clean

# Download and extract Tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97/bin/apache-tomcat-9.0.97.tar.gz /opt/

# Extract Tomcat
WORKDIR /opt/
RUN tar -xzf apache-tomcat-9.0.97.tar.gz

# Set the working directory to Tomcat bin
WORKDIR /opt/apache-tomcat-9.0.97/bin/

# Expose the Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
