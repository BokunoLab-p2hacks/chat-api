FROM ruby:3.3.4
ENV ROOT="/app"
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo

RUN apt-get update -qq
RUN apt-get install -y default-mysql-client

WORKDIR ${ROOT}

COPY Gemfile Gemfile.lock ${ROOT}

RUN gem install bundler
RUN bundle install --jobs 4

COPY . ${ROOT}

CMD ["bundle", "exec", "rails", "s", "-b", "'0.0.0.0'"]
