# DevContainers using Vim or VSCode in Podman or Docker

## Overview

The following repo is a fake Python project to show how to load up Vim or
VSCode in a Container ran either by Docker or Podman, or any container runtime
really.

## Requirements

* Container Runtime, pick one
  * Docker
  * Podman
* Visual Studio Code with Remote Development - Containers extension

## Usage

### VSCode

Simply launch VSCode and open the folder. It will detect that there is a
`.devcontainer/` folder and re-open the project in the container. VSCode will
build the container if need be.

### Command-Line

Create a Persistent Volume Claim.

```bash
docker volume create devops
```

Then build the container

```bash
docker build \
  --tag devops:1.0.0 \
  --file .devcontainer/src/DevOps.containerfile \
  .devcontainer
```

Now run the container

```bash
docker run \
  --interactive \
  --tty \
  --rm \
  --privileged \
  --mount="type=volume,src=devops,dst=/home/developer" \
  --mount="type=bind,src=$(pwd),dst=/workspace" \
  --workdir="/workspace" \
  devops:1.0.0
```

Download and setup the Vim plugins

```bash
bash /vim_setup.sh
```

Restart the container and it should work fine.
