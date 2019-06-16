FROM ruby:2.6.2-stretch

RUN gem install bundler:2.0.1

# Javascript Executor
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt install -y nodejs

WORKDIR /to-do-list

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN bundle exec rake db:migrate

CMD ["bundle", "exec", "puma"]

