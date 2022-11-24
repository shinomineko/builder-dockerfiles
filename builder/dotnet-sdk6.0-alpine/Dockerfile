FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	openjdk11-jdk \
	unzip \
	zip \
	&& rm -rf /var/lib/apt/lists/*
