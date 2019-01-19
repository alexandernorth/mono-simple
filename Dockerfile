FROM ubuntu:16.04

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install apt-transport-https gnupg -y && \
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
	echo "deb https://download.mono-project.com/repo/ubuntu stable-xenial main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
	apt-get update && \
	apt-get install mono-devel ca-certificates-mono -y && \
	apt-get purge apt-transport-https -y && \
	apt-get autoremove -y && \
	apt-get clean -y && \
	rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*