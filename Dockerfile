FROM ruby:2.6
LABEL maintainer="eddie@5xruby.tw"

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends nodejs git vim

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install

COPY . /usr/src/app/

CMD ["bin/rails", "server", "-b", "0.0.0.0"]

