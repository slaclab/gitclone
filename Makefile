CONTAINER_RUNTIME=docker
TAG?=latest
REPO?=slaclab/gitclone

build:
	$(CONTAINER_RUNTIME) build -t $(REPO):$(TAG) .

push:
	$(CONTAINER_RUNTIME) push $(REPO):$(TAG)

all: build push	
