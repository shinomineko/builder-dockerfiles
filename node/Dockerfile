FROM node:14-bullseye-slim

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

ENV CHROME_BIN=/usr/bin/google-chrome
