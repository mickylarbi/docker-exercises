FROM openjdk:17.0.2-jdk

COPY build/libs/docker-exercises-project-1.0-SNAPSHOT.jar /home/app/app.jar

WORKDIR /home/app

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]