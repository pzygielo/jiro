FROM docker.io/eclipsecbi/jiro-master:2.504.3

EXPOSE 8080
EXPOSE 50000

COPY jenkins/ref/plugins /usr/share/jenkins/ref/plugins

RUN mkdir -p /usr/share/jenkins/ref/userContent/theme/
COPY jenkins/quicksilver-light.css.override /usr/share/jenkins/ref/userContent/theme/
COPY jenkins/title.js /usr/share/jenkins/ref/userContent/theme/

USER 10001

