FROM ubuntu:16.04

# ------------------------------------------------------
# --- Update Ubuntu

RUN apt-get update 

# ------------------------------------------------------
# --- Install Utility Programs

# --- unzip
RUN apt-get install -y zip unzip curl

# --- sdkman
RUN curl -s "https://get.sdkman.io" | bash

# ------------------------------------------------------
# --- Install JDK

RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# ------------------------------------------------------
# --- Install Gradle

RUN sdk install gradle 4.1

# ------------------------------------------------------
# --- Install Android

RUN cd /opt && wget --quiet https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip && unzip sdk-tools-linux-3859397.zip && ls && pwd 
# ------------------------------------------------------
# --- Install required tools
