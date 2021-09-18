# syntax=docker/dockerfile:1.2
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
