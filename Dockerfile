FROM java:8
VOLUME /tmp
EXPOSE 8080
ADD target/gs-mysql-data-0.1.0.jar app.jar
COPY xray /usr/bin/xray-daemon
RUN bash -c 'touch /app.jar'
CMD xray-daemon -f /var/log/xray-daemon.log &
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

