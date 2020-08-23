FROM ruby:2.7.1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev git-core \
    zlib1g-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev \
    libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
RUN mkdir /rails_app
WORKDIR /rails_app
COPY rails_app/Gemfile /rails_app/Gemfile
COPY rails_app/Gemfile.lock /rails_app/Gemfile.lock
RUN bundle install
COPY rails_app /rails_app
EXPOSE 3000
CMD [ "bundle", "exec", "puma", "-C", "config/puma.rb" ]