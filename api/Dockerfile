FROM ruby:3.2.2

WORKDIR /app

RUN apt-get update && apt-get install -y \
      git \
      vim \
      sqlite3 \
      && rm -rf /var/lib/apt/lists/*

RUN gem install foreman
