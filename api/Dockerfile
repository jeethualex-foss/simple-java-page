FROM redhat/ubi10

USER root

# Install the application dependencies
RUN yum install java-21-openjdk -y

# Copy in the source code
RUN mkdir /deployments
COPY demo-0.0.1-SNAPSHOT.jar /deployments

WORKDIR /deployments

EXPOSE 8080

CMD ["java","-jar", "demo-0.0.1-SNAPSHOT.jar"]