
FROM ruby:3.2.2-slim AS base


RUN apt-get update -qq && apt-get install -y build-essential libvips nodejs npm python3

# Instalar Node.js e pnpm
ARG NODE_VERSION=20.10.0
ARG PNPM_VERSION=9.1.0
RUN curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n \
    && bash n $NODE_VERSION \
    && npm install -g pnpm@$PNPM_VERSION

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
USER 1000:1000

# Entrypoint
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Expor porta
EXPOSE 3000
CMD ["./bin/rails", "server"]