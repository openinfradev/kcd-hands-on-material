FROM openjdk:17.0.1-jdk-slim

ENV OTEL_METRICS_EXPORTER prometheus
COPY FIXME_FILENAME /usr/src/myapp/
RUN apt-get update && apt install -y curl
RUN curl -Lo /usr/src/myapp/opentelemetry-javaagent.jar https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v1.25.0/opentelemetry-javaagent.jar
WORKDIR /usr/src/myapp
EXPOSE FIXME_PORTNUM
EXPOSE 9464
CMD ["java", "-javaagent:./opentelemetry-javaagent.jar", "-jar", "FIXME_FILENAME"]
