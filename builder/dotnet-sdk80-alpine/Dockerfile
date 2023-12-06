FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	openjdk17-jdk \
	unzip \
	zip \
	&& rm -rf /var/lib/apt/lists/*
