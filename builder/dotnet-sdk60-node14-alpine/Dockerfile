FROM node:14-alpine as node

FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	ca-certificates \
	curl \
	openjdk11-jdk \
	unzip \
	&& rm -rf /var/lib/apt/lists/*

COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/share /usr/local/share
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

ARG SONAR_SCANNER_VERSION=5.0.1.3006
WORKDIR /sonar
RUN curl -sLO https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip \
	&& unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip \
	&& rm -f *.zip \
	&& ln -sfn /sonar/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner /usr/local/bin/sonar-scanner

COPY --chown=root:root ./cacerts /sonar/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/jre/lib/security/cacerts

WORKDIR /
