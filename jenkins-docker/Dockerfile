FROM jenkinsci/blueocean
USER root
COPY setup-docker-and-start-jenkins.sh /
RUN chmod 777 setup-docker-and-start-jenkins.sh
ENTRYPOINT ["/setup-docker-and-start-jenkins.sh"]
