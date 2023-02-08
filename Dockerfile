FROM tomcat:8
RUN sed -i 's/port="8080"/port="8085"/' /usr/local/tomcat/conf/server.xml
COPY ./target/*.war /usr/local/tomcat/webapps/
EXPOSE 8085
CMD ["catalina.sh", "run"]
