FROM debian:stretch-slim

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install apt-transport-https gnupg dirmngr -y && \
	export GNUPGHOME="$(mktemp -d)" && \
  	gpg --batch --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
  	gpg --batch --export --armor 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF | apt-key add - && \
  	gpgconf --kill all && \
  	rm -rf "$GNUPGHOME" && \
	echo "deb https://download.mono-project.com/repo/debian stable-stretch main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
	apt-get update && \
	apt-get install mono-devel ca-certificates-mono -y && \
	apt-get purge --auto-remove apt-transport-https gnupg dirmngr -y && \
	apt-get autoremove -y && \
	apt-get clean -y && \
	rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*
