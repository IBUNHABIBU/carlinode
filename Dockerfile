# syntax = docker/dockerfile:1

# Build arguments
ARG RUBY_VERSION=3.3.3

# Base image
FROM ruby:$RUBY_VERSION-slim AS base

# Set working directory
WORKDIR /rails

# Add sources and configure APT for HTTPS
RUN echo "deb https://deb.debian.org/debian bookworm main" > /etc/apt/sources.list && \
    echo "deb https://deb.debian.org/debian bookworm-updates main" >> /etc/apt/sources.list && \
    echo "deb https://security.debian.org/debian-security bookworm-security main" >> /etc/apt/sources.list

# Install runtime dependencies
RUN apt-get update -qq && apt-get install --no-install-recommends -y \
    libjemalloc2 \
    libvips \
    postgresql-client && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives

# Environment variables
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development test"

# Multi-stage build for gems and assets
FROM base AS build

# Install build tools for native gems
RUN apt-get update -qq && apt-get install --no-install-recommends -y \
    build-essential \
    git \
    libpq-dev \
    pkg-config \
    nodejs \
    npm && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives

# Install Yarn
RUN npm install -g yarn

# Copy Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3 && \
    rm -rf "${BUNDLE_PATH}/ruby/*/cache" "${BUNDLE_PATH}/ruby/*/bundler/gems/*/.git"

# Copy JavaScript dependency files
COPY package*json yarn.* ./

# Install JavaScript dependencies
RUN yarn install

# Copy application code and set permissions
COPY . ./
RUN chmod +x bin/*

# Precompile assets
# RUN SECRET_KEY_BASE=dummy_key ./bin/rails assets:precompile

# Final production image
FROM base

# Copy dependencies and application code from build stage
COPY --from=build "${BUNDLE_PATH}" "${BUNDLE_PATH}"
COPY --from=build /rails /rails

# Create non-root user
RUN groupadd --system --gid 999 rails && \
    useradd --system --uid 999 --gid 999 --create-home --shell /bin/bash rails && \
    chown -R rails:rails /rails

USER rails

# Entrypoint and Rails server command
ENTRYPOINT ["/rails/bin/docker-entrypoint"]
EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
