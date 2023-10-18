FROM node:18-bullseye-slim

ARG SONAR_SCANNER_VERSION=5.0.1.3006
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
	ca-certificates \
	curl \
	gnupg2 \
	unzip \
	--no-install-recommends \
	&& curl -sL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/chrome.list \
	&& apt-get update \
	&& apt-get install -y google-chrome-stable --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /sonar
RUN curl -sLO https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip \
	&& unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip \
	&& rm -f *.zip \
	&& ln -sfn /sonar/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner /usr/local/bin/sonar-scanner

COPY --chown=root:root ./cacerts /sonar/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/jre/lib/security/cacerts

WORKDIR /
ENV CHROME_BIN=/usr/bin/google-chrome
