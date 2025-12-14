FROM openjdk:17
EXPOSE 8089
ADD target/student-management-1.0.jar StudentManagement.jar
ENTRYPOINT ["java", "-jar" ,  "StudentManagement.jar"]
