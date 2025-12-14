FROM eclipse-temurin:17-jdk AS build
WORKDIR /app
COPY target/student-management-0.0.1-SNAPSHOT.jar .
FROM eclipse-temurin:17-jre
COPY --from=build /app/student-management-0.0.1-SNAPSHOT.jar StudentManagement.jar
ENTRYPOINT ["java","-jar","StudentManagement.jar"]
