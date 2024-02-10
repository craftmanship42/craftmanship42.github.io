# Define variables
IMAGE_NAME=software-artesans-site-image
CONTAINER_NAME=software-artesans-site
HOST_PORT := 1313
CONTAINER_PORT := 1313

# Default action
.PHONY: build init run stop shell

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run --name $(CONTAINER_NAME) -d -p $(HOST_PORT):$(CONTAINER_PORT) -v ${PWD}:/src $(IMAGE_NAME) sh -c "npm run dev"

shell:
	docker exec -it $(CONTAINER_NAME) /bin/sh

stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
