GIT_COMMIT ?= $(shell git rev-parse --verify HEAD)

.PHONY: build
build:
	docker build \
		--build-arg GIT_COMMIT=${GIT_COMMIT} \
		-t edgargonzalez/nyc-geoclient-2.0.0-rc.1:latest \
    -t edgargonzalez/nyc-geoclient-2.0.0-rc.1:${GIT_COMMIT} \
    .
