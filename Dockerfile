FROM openjdk:17
EXPOSE 9090
ADD target/devops-project.jar devops-project.jar
ENTRYPOINT ["java","-jar","/devops-project.jar"]
