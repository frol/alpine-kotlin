FROM frolvlad/alpine-oraclejdk8:slim

ENV KOTLIN_VERSION=1.0.0-beta-3595 \
    KOTLIN_HOME=/usr/share/kotlin

RUN apk add --update bash wget && \
    cd /tmp && \
    wget --no-check-certificate "https://github.com/JetBrains/kotlin/releases/download/build-${KOTLIN_VERSION}/kotlin-compiler-${KOTLIN_VERSION}.zip" && \
    unzip "kotlin-compiler-${KOTLIN_VERSION}.zip" && \
    mkdir "${KOTLIN_HOME}" && \
    rm "/tmp/kotlinc/bin/"*.bat && \
    mv "/tmp/kotlinc/bin" "/tmp/kotlinc/lib" "${KOTLIN_HOME}" && \
    ln -s "${KOTLIN_HOME}/bin/"* "/usr/bin/" && \
    rm -rf /tmp/* /var/cache/apk/*
