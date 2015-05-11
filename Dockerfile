FROM ruby:2.1.3

ADD Gemfile Gemfile.lock /app/
WORKDIR /app/

RUN bundle install

ADD . /app/

RUN rake sq:migrate:down && rake sq:migrate:up

ENTRYPOINT ["/usr/local/bundle/bin/bundle", "exec", "puma"]
