FROM maven:3.6.3-openjdk-11 as build

ARG VERSION
ARG JAR_NAME=rest-crud-spring-0.0.1

VOLUME /tmp
WORKDIR /
ADD . .

RUN mvn clean test package
RUN mv /target/rest-crud-spring-0.0.1.jar /rest-crud-spring-0.0.1.jar

# package stage
FROM openjdk:11.0-jre-slim
WORKDIR /
# copy only the built jar and nothing else
COPY --from=build /rest-crud-spring-0.0.1.jar /

ENV VERSION=$VERSION
ENV JAVA_OPTS=-Dspring.profiles.active=production

EXPOSE 8080

ENTRYPOINT ["sh","-c","java -jar -Dspring.profiles.active=production /rest-crud-spring-0.0.1.jar"]