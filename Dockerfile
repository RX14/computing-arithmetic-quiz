FROM ruby:2.1.3

ADD Gemfile /app/
WORKDIR /app/

RUN bundle install

ADD . /app/

ENTRYPOINT ["/usr/local/bundle/bin/bundle", "exec", "puma"]
