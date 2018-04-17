NAME = edgargonzalez/nyc-geoclient
VERSION = 2.0.0-rc.1-18a

.PHONY: build
build:
	docker build -t $(NAME):latest -t $(NAME):$(VERSION) .

.PHONY: release
release:
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! head -n 1 Changelog.md | grep -q 'release date'; then echo 'Please note the release date in Changelog.md.' && false; fi
	docker push $(NAME)
	@echo "*** Don't forget to create a tag. git tag rel-$(VERSION) && git push origin rel-$(VERSION)"

.PHONY: run
run:
	docker run -it --rm -p 8080:8080 $(NAME)
