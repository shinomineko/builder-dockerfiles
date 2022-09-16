FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	ca-certificates \
	curl \
	nodejs \
	openjdk11-jdk \
	unzip \
	&& rm -rf /var/lib/apt/lists/*

ARG SONAR_SCANNER_VERSION=4.7.0.2747
WORKDIR /sonar
RUN curl -sLO https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip \
	&& unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip \
	&& rm -f *.zip \
	&& ln -sfn /sonar/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner /usr/local/bin/sonar-scanner

COPY --chown=root:root ./cacerts /sonar/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/jre/lib/security/cacerts

WORKDIR /
