FROM local/gcs-base:latest

#RUN apt-get -qq update
RUN apt-get install -y lsof nmap less

EXPOSE 2811
EXPOSE 7512
EXPOSE 50000-50100

COPY assets/globus-connect-server.conf /etc/
COPY assets/entrypoint.sh /

RUN TERM=xterm /usr/bin/globus-connect-server-setup

CMD ["/entrypoint.sh"]
#
#RUN adduser --home /home/gcsuser --shell /bin/bash --disabled-password --gecos none gcsuser
#WORKDIR /home/gcsuser
#USER gcsuser
#ENV USER gcsuser

#
## Add GCP to PATH
#ENV PATH /usr/local/share/globusconnectpersonal/:$PATH
