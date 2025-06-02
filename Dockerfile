FROM redhat/ubi10-minimal

USER root

# Install the application dependencies
RUN microdnf update -y
RUN microdnf install httpd httpd-tools -y

# Copy in the source code
RUN mkdir /deployments
COPY src /var/www/html
COPY bin /deployments

WORKDIR /deployments

EXPOSE 80

CMD ["sh","startup.sh"]