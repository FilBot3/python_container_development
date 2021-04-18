.PHONY: build run-vim

ce = docker

build:
	$(ce) build \
		--tag devops:1.0.0 \
		--file .devcontainer/src/DevOps.containerfile \
		.devcontainer/

mk-volume:
	$(ce) volume create devops

run-vim:
	$(ce) run \
		--interactive \
		--tty \
		--rm \
		--privileged \
		--mount="type=volume,src=devops,dst=/home/developer" \
		--mount="type=bind,src=$(shell pwd),dst=/workspace" \
		--workdir="/workspace" \
		devops:1.0.0
