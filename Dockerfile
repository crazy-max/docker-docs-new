# syntax=docker/dockerfile:1

ARG MKDOCS_MATERIAL_VERSION=7.2.6

FROM squidfunk/mkdocs-material:${MKDOCS_MATERIAL_VERSION} AS base
RUN apk add --no-cache \
    git \
    git-fast-import \
    openssl \
  && apk add --no-cache --virtual .build gcc musl-dev \
  && pip install --no-cache-dir \
    lunr \
    markdown-include \
    mkdocs-awesome-pages-plugin \
    mkdocs-exclude \
    mkdocs-git-revision-date-localized-plugin \
    mkdocs-macros-plugin \
    mkdocs-minify-plugin \
    mkdocs-redirects \
  && rm -rf /tmp/*

FROM base AS generate
RUN --mount=type=bind,target=. \
  mkdocs build --site-dir /tmp/site

FROM scratch AS release
COPY --from=generate /tmp/site/ /

FROM caddy:2-alpine AS serve
RUN rm -rf /usr/share/caddy/*
COPY --from=generate /tmp/site/ /usr/share/caddy/
COPY rootfs /

FROM serve as dd-ext
LABEL org.opencontainers.image.title="Embedded Docs" \
  org.opencontainers.image.description="Embedded Docs Extension." \
  org.opencontainers.image.vendor="Docker Inc." \
  com.docker.desktop.extension.api.version="0.2.0"
COPY ddext /
WORKDIR /
