FROM openjdk:17
EXPOSE 8081
ADD target/my-application.jar my-application.jar
ENTRYPOINT ["java","-jar","/my-application.jar"]


