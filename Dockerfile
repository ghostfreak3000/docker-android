FROM ubuntu:16.04

# ------------------------------------------------------
# --- Update Ubuntu

RUN apt-get update 

# ------------------------------------------------------
# --- Install Utility Programs

RUN apt-get install -y unzip

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

# ------------------------------------------------------
# --- Install Android

# --- dependencies
#RUN apt-get install -y libbz2-1.0 lib32z1 lib32ncurses5 lib32stdc++6

# --- sdk
#RUN cd /opt && wget --quiet https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip && unzip sdk-tools-linux-3859397.zip && ls && pwd 

# ------------------------------------------------------
# --- Install required tools
