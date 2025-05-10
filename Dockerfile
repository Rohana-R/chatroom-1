FROM maven AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-alpine
WORKDIR /app
COPY --from=builder /app/target/*.jar chat.jar
CMD ["java", "-jar", "chat.jar"]
EXPOSE 8080