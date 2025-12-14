FROM openjdk:17-jdk
EXPOSE 8089
ADD target/student-management-0.0.1-SNAPSHOT.jar StudentManagement.jar
CMD ["java", "-jar", "StudentManagement.jar"]
