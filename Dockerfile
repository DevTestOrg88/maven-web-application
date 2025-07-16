FROM maven:3.8.7-eclipse-temurin-19-alpine AS build
WORKDIR /app
RUN apt-get update && apt-get install -y git \
    && git clone https://github.com/your-username/your-repo.git .
ENV BUILD_NUMBER=3
COPY maven-web-application/pom.xml maven-web-application/src /app/
RUN mvn clean package -DskipTests

FROM tomcat:9.0.107-jdk21
COPY --from=build /app/target/maven-web-application.war /usr/local/tomcat/webapps/maven-web-application.war
