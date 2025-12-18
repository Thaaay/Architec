
FROM ruby:3.2.2-slim AS base


RUN apt-get update -qq && apt-get install -y build-essential libvips nodejs npm python3

WORKDIR /rails


ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"


FROM base AS build


COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git


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