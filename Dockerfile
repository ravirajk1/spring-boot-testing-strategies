FROM java:8
EXPOSE 8085
ADD target/mvc-tests.jar mvc-tests.jar
ENTRYPOINT ["java","-jar", "mvc-tests.jar"]