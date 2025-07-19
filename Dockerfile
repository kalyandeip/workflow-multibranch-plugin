# Stage 1: Build plugin using Maven and Java 11
FROM maven:3.9.6-eclipse-temurin-11 AS builder

# Set working directory
WORKDIR /usr/src/app

# Copy all files to the container
COPY . .

# Build the Jenkins plugin (skip tests for speed)
RUN mvn clean install -DskipTests -U

# Stage 2 (optional): Copy only plugin artifact to a minimal image
# FROM eclipse-temurin:11-jre
# COPY --from=builder /usr/src/app/target/*.hpi /plugin/

# CMD ["ls", "-lh", "/plugin"]

# If you just want the .hpi file, we can stop at builder stage.
# Use this if you're just running docker build to compile.
CMD ["sh", "-c", "ls -lh target/*.hpi"]
