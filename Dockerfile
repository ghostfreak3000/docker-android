FROM ubuntu:16.04

# ------------------------------------------------------
# --- Update Ubuntu

RUN apt-get update 

# ------------------------------------------------------
# --- Install Utility Programs

RUN apt-get install -y unzip wget

# ------------------------------------------------------
# --- Install JDK

RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# ------------------------------------------------------
# --- Install Gradle

RUN wget https://downloads.gradle.org/distributions/gradle-4.1-bin.zip
RUN mkdir /opt/gradle
RUN unzip -d /opt/gradle gradle-4.1-bin.zip
RUN ls /opt/gradle/gradle-4.1
ENV GRADLE_HOME /opt/gradle/gradle-4.1
ENV PATH ${PATH}:${GRADLE_HOME}/bin

# ------------------------------------------------------
# --- Install Android

# --- dependencies
RUN apt-get install -y libbz2-1.0 lib32z1 lib32ncurses5 lib32stdc++6

# --- sdk
RUN wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip 
RUN unzip -d /opt sdk-tools-linux-3859397.zip
RUN ls /opt

# ------------------------------------------------------
# --- Install required tools
