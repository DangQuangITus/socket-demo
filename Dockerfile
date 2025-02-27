# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine
# Add Maintainer Info
MAINTAINER nguyendangquangkt@gmail.com
# Add a volume pointing to /tmp
VOLUME /tmp
COPY .mvn/ .mvn
COPY ./mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY src ./src
CMD ["./mvnw","spring-boot:run"]
# Make port 8080 available to the world outside this container
#EXPOSE 8080
# The application's jar file
#ARG JAR_FILE=target/websocket-demo-0.0.1-SNAPSHOT.jar
## Add the application's jar to the container
#ADD ${JAR_FILE} websocket-demo.jar
# Run the jar file 
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/websocket-demo.jar"]

