FROM redhat/ubi10-minimal

# Install the application dependencies
RUN microdnf update -y
RUN microdnf install httpd httpd-tools -y

# Copy in the source code
RUN mkdir /deployments
COPY src /var/www/html
COPY bin /deployments

# Server changes
RUN echo 'ServerName 127.0.0.1' >> /etc/httpd/conf/httpd.conf

WORKDIR /deployments

EXPOSE 80

CMD ["sh","startup.sh"]