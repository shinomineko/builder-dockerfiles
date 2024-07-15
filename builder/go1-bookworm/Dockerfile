FROM golang:1.22-bookworm

ARG SONAR_SCANNER_VERSION=5.0.1.3006
ARG GOLANGCI_LINT_VERSION=v1.59.1
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
	ca-certificates \
    curl \
	unzip \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /sonar
RUN curl -sLO https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip \
	&& unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip \
	&& rm -f *.zip \
	&& ln -sfn /sonar/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner /usr/local/bin/sonar-scanner

COPY --chown=root:root ./cacerts /sonar/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/jre/lib/security/cacerts

WORKDIR /go
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin ${GOLANGCI_LINT_VERSION}
