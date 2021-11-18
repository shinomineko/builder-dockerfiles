FROM mcr.microsoft.com/dotnet/aspnet:2.1
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y apt-transport-https --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*
