# Stage 1: Build the Jenkins plugin
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# Install tools needed for Jenkins plugin builds
RUN apt-get update && apt-get install -y git zip

WORKDIR /app

# Copy source code
COPY . .

# Build and test the plugin
RUN mvn clean verify

# Stage 2: Runtime image (if you want to run something)
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy the built plugin (.hpi)
COPY --from=builder /app/target/*.hpi /app/

# Default command (optional)
CMD ["ls", "-l", "/app"]
