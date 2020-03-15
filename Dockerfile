FROM ruby:2.6.5-alpine as base

RUN apk update \
    && apk add -q --no-cache \
    build-base \
    bash \
    graphviz \
    build-base \
    postgresql-dev \
    netcat-openbsd \
    curl \
    gnupg \
    libxml2-dev \
    libxslt-dev \
    unzip \
    tzdata
# -_-_-_-_-

FROM base as application

RUN gem install bundler

RUN mkdir -p /app
WORKDIR /app

COPY . .
COPY Gemfile Gemfile.lock ./

RUN bundle install

ENTRYPOINT [ "bash", "docker/entry.sh" ]
EXPOSE 3000
