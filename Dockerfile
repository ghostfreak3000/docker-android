FROM ubuntu:16.04

# ------------------------------------------------------
# --- Update Ubuntu

RUN apt-get update 

# ------------------------------------------------------
# --- Install Utility Programs

# --- unzip
RUN apt-get install -y unzip

# --- sdkman
RUN curl -s "https://get.sdkman.io" | bash
RUN source "$HOME/.sdkman/bin/sdkman-init.sh"

# ------------------------------------------------------
# --- Install JDK

RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# ------------------------------------------------------
# --- Install Gradle

RUN sdk install gradle 4.1

# ------------------------------------------------------
# --- Install Android



# ------------------------------------------------------
# --- Install required tools
