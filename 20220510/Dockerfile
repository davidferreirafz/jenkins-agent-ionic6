###############################################################################
#  Dockerfile for build mobile ionic6 apps                                    #
###############################################################################
FROM jenkins/inbound-agent:jdk11

LABEL org.opencontainers.image.created="2022-05-10"
LABEL org.opencontainers.image.authors="David Ferreira <davidaf@bnb.gov.br><davidferreira.fz@gmail.com>"
LABEL org.opencontainers.image.title="Jenkins Inbound Agent for IONIC 6"
LABEL org.opencontainers.image.description="Jenkins Inbound Agente for IONIC 6 with Debian 11(Bullseye), OpenJDK 11, Node 14, Android SDK 30"


ENV ANDROID_HOME="/opt/android"
ENV ANDROID_SDK_ROOT="/opt/android"

USER root

RUN apt-get update && \
    apt-get install wget unzip curl && \
    echo "Y" | apt-get install ca-certificates-java && \
    apt-get install ca-certificates

# Install Node
RUN wget https://deb.nodesource.com/setup_14.x -O /tmp/script-node.sh && \
    bash - /tmp/script-node.sh && \
    apt-get install -y nodejs

# Install android command line
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-8092744_latest.zip -O /tmp/tools.zip && \
    mkdir -p ${ANDROID_HOME} && \
    unzip -qq /tmp/tools.zip -d ${ANDROID_HOME} && \
    rm -v /tmp/tools.zip && \
    mkdir -p ~/.android/ && \
    touch ~/.android/repositories.cfg

# Install android sdk
RUN yes | ${ANDROID_HOME}/cmdline-tools/bin/sdkmanager "--licenses" --sdk_root=${ANDROID_SDK_ROOT} && \
    ${ANDROID_HOME}/cmdline-tools/bin/sdkmanager "--update" --sdk_root=${ANDROID_SDK_ROOT} && \
    ${ANDROID_HOME}/cmdline-tools/bin/sdkmanager "platform-tools" --sdk_root=${ANDROID_SDK_ROOT} && \
    ${ANDROID_HOME}/cmdline-tools/bin/sdkmanager "build-tools;30.0.2" "platforms;android-30" --sdk_root=${ANDROID_SDK_ROOT} && \
    ${ANDROID_HOME}/cmdline-tools/bin/sdkmanager "build-tools;30.0.3" "platforms;android-31" --sdk_root=${ANDROID_SDK_ROOT} && \
    ${ANDROID_HOME}/cmdline-tools/bin/sdkmanager "ndk;21.0.6113669" --include_obsolete --sdk_root=${ANDROID_SDK_ROOT}

# Install Ionic
RUN npm install -g @ionic/cli@6.18.0 && \
    npm install -g @capacitor/cli@3.3.3 && \
    echo "N" | npm i -g @angular/cli@13.0.4 && \
    npm install -g @capacitor/ios@3.4.3  && \
    npm install -g @ionic/angular@6.0.16  && \
    npm install -g @capacitor/android@3.4.3 @capacitor/core@3.4.3 @capacitor/ios@3.4.3  && \
    npm install -g @ionic/angular-toolkit@5.0.3  && \
    npm install -g @angular-devkit/schematics@13.0.4 @angular-devkit/build-angular@13.0.4

