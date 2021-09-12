# Docker docs

## About

Sample repository for [Docker documentation](https://docs.docker.com/) to
try out [Mkdocs Material](https://github.com/squidfunk/mkdocs-material/).

Live at https://crazymax.dev/docker-docs/

## Usage

```shell
# Build docs image and output to ./site
docker buildx bake
# Run docs image and watch for changes with compose
docker-compose up
# or with docker run
docker buildx bake base
docker run --rm -it -p 8000:8000 -v $(pwd):/docs docs:local
# Open http://localhost:8000 in your browser
```

## Resources

* https://crazymax.dev/docker-docs/macros/
* https://www.mkdocs.org/
* https://squidfunk.github.io/mkdocs-material/getting-started/
* https://facelessuser.github.io/pymdown-extensions/
* https://mkdocs-macros-plugin.readthedocs.io/en/latest/
* https://jinja.palletsprojects.com/en/3.0.x/templates/
