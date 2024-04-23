FROM maven:3.8.6-openjdk-18 as build
WORKDIR /app
COPY . .
RUN mvn clean package -Dmaven.test.failure.ignore=true


FROM openjdk:18-jdk-alpine
COPY --from=build /app/target/project_2_server-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT [ "java", "-jar" , "app.jar" ]