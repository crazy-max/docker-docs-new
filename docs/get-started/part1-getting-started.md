---
tags:
  - get started
  - setup
  - orientation
  - quickstart
  - intro
  - concepts
  - containers
  - docker desktop
---

<style>
.md-typeset .md-button--primary {
  min-width: 220px;
  text-align: center;
  margin-top: 5px;
}
</style>

# Part 1: Getting started
{% include 'rtime.md' %}

Welcome! We are excited that you want to learn Docker.

This page contains step-by-step instructions on how to get started with Docker.
In this tutorial, you'll learn how to:

- Build and run an image as a container
- Share images using Docker Hub
- Deploy Docker applications using multiple containers with a database
- Running applications using Docker Compose

In addition, you'll also learn about the best practices for building images,
including instructions on how to scan your images for security vulnerabilities.

If you are looking for information on how to containerize an application using
your favorite language, see [Language-specific getting started guides](../../language/index.md).

We also recommend the video walkthrough from DockerCon 2020.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/iqqDU2crIEQ?start=30" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Download and install Docker

This tutorial assumes you have a current version of Docker installed on your
machine. If you do not have Docker installed, choose your preferred operating
system below to download Docker:

[Mac with Intel chip](https://desktop.docker.com/mac/stable/amd64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-amd64){: .md-button .md-button--primary }
[Mac with Apple chip](https://desktop.docker.com/mac/stable/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64){: .md-button .md-button--primary }
[Windows](https://desktop.docker.com/win/stable/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-win-amd64){: .md-button .md-button--primary }
[Linux](../../engine/install/index.md){: .md-button .md-button--primary }

!!! note
    For Docker Desktop installation instructions, see [Install Docker Desktop on Mac](../../docker-for-mac/install.md)
    and [Install Docker Desktop on Windows](../../docker-for-windows/install.md).

{% include 'eula.md' %}

## Start the tutorial

If you've already run the command to get started with the tutorial,
congratulations! If not, open a command prompt or bash window, and run the
command:

```shell
docker run -d -p "80:80" docker/getting-started
```

You'll notice a few flags being used. Here's some more info on them:

- `-d` - run the container in detached mode (in the background)
- `-p "80:80"` - map port 80 of the host to port 80 in the container
- `docker/getting-started` - the image to use

!!! tip
    You can combine single character flags to shorten the full command.
    As an example, the command above could be written as:
    ```shell
    docker run -dp "80:80" docker/getting-started
    ```

## The Docker Dashboard

Before going too far, we want to highlight the Docker Dashboard, which gives
you a quick view of the containers running on your machine. The Docker Dashboard
is available for Mac and Windows.

It gives you quick access to container logs, lets you get a shell inside
the container, and lets you easily manage container lifecycle (stop, remove, etc.).

To access the dashboard, follow the instructions for either
[Mac](../../docker-for-mac/dashboard/) or
[Windows](../../docker-for-windows/dashboard/). If you open the dashboard
now, you will see this tutorial running! The container name (`jolly_bouman` below) is a
randomly created name. So, you'll most likely have a different name.

![Tutorial container running in Docker Dashboard](../assets/images/get-started/tutorial-in-dashboard.png)

## What is a container?

Now that you've run a container, what _is_ a container? Simply put, a container is
simply another process on your machine that has been isolated from all other processes
on the host machine. That isolation leverages [kernel namespaces and cgroups](https://medium.com/@saschagrunert/demystifying-containers-part-i-kernel-space-2c53d6979504){: target=_blank },
features that have been in Linux for a long time. Docker has worked to make
these capabilities approachable and easy to use.

!!! quote "Creating containers from scratch"
    If you'd like to see how containers are built from scratch, Liz Rice from Aqua Security
    has a fantastic talk in which she creates a container from scratch in Go. While she makes
    a simple container, this talk doesn't go into networking, using images for the filesystem,
    and more. But, it gives a _fantastic_ deep dive into how things are working.

    <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/8fi7uSYlOdc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## What is a container image?

When running a container, it uses an isolated filesystem. This custom filesystem
is provided by a **container image**. Since the image contains the container's
filesystem, it must contain everything needed to run an application - all
dependencies, configuration, scripts, binaries, etc. The image also contains
other configuration for the container, such as environment variables, a default
command to run, and other metadata.

We'll dive deeper into images later on, covering topics such as layering, best
practices, and more.

!!! info
    If you're familiar with `chroot`, think of a container as an extended version of `chroot`. The
    filesystem is simply coming from the image. But, a container adds additional isolation not
    available when simply using chroot.

## CLI references

Refer to the following topics for further documentation on all CLI commands used
in this article:

- [docker version](../../engine/reference/commandline/version.md)
- [docker run](../../engine/reference/commandline/run.md)
- [docker image](../../engine/reference/commandline/image.md)
- [docker container](../../engine/reference/commandline/container.md)
