FROM ubuntu:18.04

LABEL version="1.0.1"
LABEL repository="https://github.com/aiera-inc/action-deploy"
LABEL homepage="https://www.aiera.com/"
LABEL maintainer="Aiera <support@aiera.com>"

LABEL "com.github.actions.name"="Convox Deploy"
LABEL "com.github.actions.description"="Build and Deploy an app to Convox in one step"
LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="blue"

RUN apt-get -qq update && apt-get -qq -y install curl

RUN curl -L https://github.com/convox/convox/releases/latest/download/convox-linux -o /tmp/convox \
    && mv /tmp/convox /usr/local/bin/convox \
    && chmod 755 /usr/local/bin/convox

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
