FROM mcr.microsoft.com/dotnet/sdk:3.1

COPY ./assets/certs/internal-ca.crt /usr/local/share/ca-certificates/internal-ca.crt

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends \
	bash \
	ca-certificates \
	openjdk-11-jdk \
	&& rm -rf /var/lib/apt/lists/* \
	&& update-ca-certificates \
	&& keytool \
	-import \
	-keystore /etc/ssl/certs/java/cacerts \
	-storepass changeit \
	-trustcacerts \
	-file /usr/local/share/ca-certificates/internal-ca.crt \
	-alias internal-root-ca \
	-noprompt \
	&& dotnet tool install --global dotnet-sonarscanner

ENV PATH="$PATH:/root/.dotnet/tools"
