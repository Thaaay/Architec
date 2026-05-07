
FROM ruby:3.2.2-slim AS base

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    libvips \
    curl \
    ca-certificates \
    gnupg \
    python3 && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives


RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g pnpm@9.1.0

WORKDIR /rails



ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"


FROM base AS build

COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git


COPY package.json pnpm-lock.yaml* ./

RUN pnpm install --frozen-lockfile

COPY . .


RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

COPY . .


RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile


FROM base


COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails


RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash

RUN chown -R rails:rails db log storage tmp

USER 1000:1000

ENTRYPOINT ["/rails/bin/docker-entrypoint"]
EXPOSE 3000
CMD ["./bin/rails", "server"]