FROM maven:3.9.5-jdk-18 as build
WORKDIR /app
COPY . .
RUN mvn clean package -Dmaven.test.failure.ignore=true


FROM openjdk:18-oraclelinux8
COPY --from=build /app/target/testSQL-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT [ "java", "-jar" , "app.jar" ]