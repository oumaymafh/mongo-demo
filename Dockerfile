FROM openjdk:17
EXPOSE 9090
ADD target/my-application.jar my-application.jar
ENTRYPOINT ["java","-jar","/my-application.jar"]


