# Ran below command from docker cli to create image
#docker build -t gitbuild1:1 https://github.com/DevTestOrg88/maven-web-application.git
# Ran below command from docker cli to start the container
#docker run -d --name test -p 8080:8080 gitbuild1:1

FROM maven:3.8.7-eclipse-temurin-19-alpine AS build
WORKDIR /app
ENV BUILD_NUMBER=3
COPY . .
RUN mvn clean package -DskipTests

FROM tomcat:9.0.107-jdk21
COPY --from=build /app/target/maven-web-application.war /usr/local/tomcat/webapps/maven-web-application.war
