FROM mcr.microsoft.com/dotnet/sdk:5.0

LABEL "com.github.actions.name"="dotnet-sonarscanner"
LABEL "com.github.actions.description"="sonarscanner for dotnet core"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="https://github.com/Secbyte/dotnet-sonarscanner"
LABEL "homepage"="https://github.com/Secbyte/dotnet-sonarscanner"
LABEL "maintainer"="Joshua Duffy <mail@joshuaduffy.org>"

RUN apt-get update && \
    apt-get install -y --no-install-recommends default-jre apt-transport-https mono-complete && \
    apt-get install -y --no-install-recommends python3 python3-distutils python3-pip python3-setuptools dotnet-sdk-6.0 && \
    apt-get autoremove -y && \
    dotnet tool install dotnet-sonarscanner --tool-path . --version 5.12.0

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
