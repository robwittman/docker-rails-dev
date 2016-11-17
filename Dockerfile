FROM ruby:2.3

MAINTAINER Rob Wittman <rob@ihsdigital.com>

RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs

RUN mkdir -p /app

WORKDIR /app

COPY Gemfile ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]