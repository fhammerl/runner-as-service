FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
ENV RUNNER_ALLOW_RUNASROOT 1
RUN apt-get update && apt-get install -y \
curl jq sudo systemd
ADD install.sh /root/install.sh
RUN chmod u+x /root/install.sh

ENTRYPOINT sudo -E /root/install.sh