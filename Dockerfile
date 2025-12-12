# Sintaxe para build multi-stage
FROM ruby:3.2.2-slim AS base

# Dependências do sistema
RUN apt-get update -qq && apt-get install -y build-essential libvips nodejs npm python3

WORKDIR /rails

# Variáveis de ambiente
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# Fase de Build
FROM base AS build

# Instalar gems
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

# Copiar código da aplicação
COPY . .

# Pré-compilar assets (necessário para produção)
# Nota: Para dev, você pode pular isso ou ajustar o comando
RUN bundle exec rake assets:precompile

# Fase Final (Runner)
FROM base

# Copiar artefatos do build
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Configurar usuário não-root (boa prática de segurança)
RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash
USER 1000:1000

# Entrypoint
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Expor porta
EXPOSE 3000
CMD ["./bin/rails", "server"]