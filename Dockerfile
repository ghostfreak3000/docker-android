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
ENV GRADLE_HOME /opt/gradle/gradle-4.1
ENV PATH ${PATH}:${GRADLE_HOME}/bin

# ------------------------------------------------------
# --- Install Android

# --- dependencies
RUN apt-get install -y libbz2-1.0 lib32z1 lib32ncurses5 lib32stdc++6

# --- sdk
RUN wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip 
RUN mkdir /opt/android-sdk-linux
RUN unzip -d /opt/android-sdk-linux sdk-tools-linux-3859397.zip
RUN chown -R root:root /opt/android-sdk-linux
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin

# --- install platform-25 and build-tools-25.0.0
RUN echo "y" | sdkmanager --verbose "platforms;android-25" "build-tools;25.0.0" "extra-android-m2repository" "extra-android-support" "extra-google-google_play_services_froyo" "extra-google-google_play_services" "extra-google-m2repository" "extra-google-play_apk_expansion" "extra-google-play_billing" "extra-google-play_licensing" "extra-google-webdriver"                               

# ------------------------------------------------------
# --- Clean up
RUN rm gradle-4.1-bin.zip
RUN rm sdk-tools-linux-3859397.zip
RUN apt-get clean

