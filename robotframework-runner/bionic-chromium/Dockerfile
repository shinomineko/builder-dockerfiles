FROM ubuntu:bionic

COPY chromium-browser-apt-preferences /etc/apt/preferences.d/chromium-browser
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
	&& apt-get update -y \
	&& apt-get install -y python3-pip software-properties-common \
	&& add-apt-repository -y ppa:chromium-team/dev \
	&& apt-get install -y chromium-browser

COPY requirements.txt .
RUN python3 -m pip install --upgrade pip \
	&& python3 -m pip install -r requirements.txt \
	&& webdrivermanager chrome

ENV LANG=en_US.UTF-8 \
	LANGUAGE=en_US:UTF-8 \
	LC_ALL=en_US.UTF-8
RUN apt-get install -y locales \
	&& locale-gen en_US.UTF-8 \
	&& rm -rf /var/lib/apt/lists/*
