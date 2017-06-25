.DEFAULT_GOAL := test

SOURCERY=$(PWD)/.build/release/sourcery

## install dependencies
install:
	brew bundle

## build the project and run the tests
test: sourcery
	cd Tests; $(SOURCERY)
	swift test
	swiftlint

## run sourcery to generate code from the root templates
sourcery: $(SOURCERY)
	$(SOURCERY)

## run Sourcery in watch mode for live preview of templates
watch: $(SOURCERY)
	$(SOURCERY) --watch

## clean the project build artifacts
clean:
	swift package clean

## generate an Xcode project without the custom build steps like Sourcery and Swiftlint
xcode: sourcery
	swift package generate-xcodeproj
	open AutoJSONSerialization.xcodeproj

XCODEFLAGS=-project 'AutoJSONSerialization.xcodeproj' \
				-scheme 'AutoJSONSerialization' \
				-enableCodeCoverage YES

## setup the environment and run the tests using the Xcode generated project to generate code coverage
ci: install test
	swift package generate-xcodeproj
	xcodebuild $(XCODEFLAGS) test

.PHONY: release_pod_patch
## release a new patch version of the pod. See `fastlane lanes` for more information
release_pod_patch:
	bundle exec fastlane release_pod bump_type:patch

.PHONY: release_pod_minor
## release a new minor version of the pod. See `fastlane lanes` for more information
release_pod_minor:
	bundle exec fastlane release_pod bump_type:minor

.PHONY: release_pod_major
## release a new major version of the pod. See `fastlane lanes` for more information
release_pod_major:
	bundle exec fastlane release_pod bump_type:major

$(SOURCERY):
	swift build -c release

.PHONY: install sourcery watch test clean xcode ci

.PHONY: download_tools
## Replace all binary tools with the version specified in the download scripts
download_tools:
	scripts/download_sourcery.sh

.PHONY: help
# taken from this gist https://gist.github.com/rcmachado/af3db315e31383502660
## Show this help message.
help:
	$(info Usage: make [target...])
	$(info Available targets)
	@awk '/^[a-zA-Z\-\_0-9]+:/ {                    \
		nb = sub( /^## /, "", helpMsg );              \
		if(nb == 0) {                                 \
			helpMsg = $$0;                              \
			nb = sub( /^[^:]*:.* ## /, "", helpMsg );   \
		}                                             \
		if (nb)                                       \
			print  $$1 "\t" helpMsg;                    \
	}                                               \
	{ helpMsg = $$0 }'                              \
	$(MAKEFILE_LIST) | column -ts $$'\t' |          \
	grep --color '^[^ ]*'
