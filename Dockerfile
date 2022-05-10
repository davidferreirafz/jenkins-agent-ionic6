###############################################################################
#  Dockerfile for build mobile ionic6 apps                                    #
###############################################################################
FROM davidferreirafz/jenkins-agent-android:20220510
LABEL org.opencontainers.image.created="2022-05-10"
LABEL org.opencontainers.image.authors="David Ferreira <davidaf@bnb.gov.br><davidferreira.fz@gmail.com>"
LABEL org.opencontainers.image.title="Jenkins Inbound Agent for IONIC 6"
LABEL org.opencontainers.image.description="Jenkins Inbound Agente for IONIC 6 with Debian 11(Bullseye), OpenJDK 11, Node 14, Android SDK 30"



# Install Ionic
RUN npm i -g playwright --unsafe-perm=true --allow-root && \
    npm i -g @ionic/cli --unsafe-perm=true --allow-root && \
    npm i -g @ionic/angular --unsafe-perm=true --allow-root && \
    npm i -g @ionic/angular-toolkit --unsafe-perm=true --allow-root && \
    npm i -g @angular/cli --unsafe-perm=true --allow-root && \
    npm i -g @capacitor/cli @capacitor/core --unsafe-perm=true --allow-root && \
    npm i -g @capacitor/ios @capacitor/android --unsafe-perm=true --allow-root