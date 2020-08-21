FROM ruby:2.7.0

RUN bundle config --global frozen 1
RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

RUN bundle install
ENV RAILS_ENV production
ENV SECRET_KEY_BASE 0decba245f367658bfd7b504a88854660619cef5a0a128e8cf1bc7ab0f54eb90493e026a2deb7f453ae5f606ef7a438b711d1be845088ef5a271a976bf8e3798
ENV RUBYOPT '-W:no-deprecated -W:no-experimental'
ENV RAILS_SERVE_STATIC_FILES true

COPY . /usr/src/app

RUN apt-get update && \
apt-get install -y nodejs --no-install-recommends && \
rm -rf /var/lib/apt/lists/*
RUN apt-get update && \
apt-get install -y \
postgresql-client \
sqlite3 --no-install-recommends && \
rm -rf /var/lib/apt/lists/*

RUN rake db:migrate && rake db:seed && rake assets:precompile

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]