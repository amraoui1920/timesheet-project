FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY target/timesheet-devops-1.0.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
