.DEFAULT_GOAL := test

SOURCERY=$(PWD)/tools/Sourcery/bin/sourcery
SWIFTLINT=$(PWD)/tools/swiftlint/swiftlint

SPM_XCODE_OPTIONS=--enable-code-coverage \
									--xcconfig-overrides "xcode.xcconfig"

XCODEFLAGS=-project 'AutoJSONSerialization.xcodeproj' \
				-scheme 'AutoJSONSerialization-Package'

.PHONY: install
## install the requirements
install:
	bundle install

## build the project and run the tests
test: sourcery
	cd Tests; $(SOURCERY)
	@echo "XCODE_DEFAULT_TOOLCHAIN_OVERRIDE: ${XCODE_DEFAULT_TOOLCHAIN_OVERRIDE}"
	@echo "TOOLCHAIN_DIR: ${TOOLCHAIN_DIR}"
	@echo "xcrun: `xcrun -find swift`"
	git --no-pager diff
	swift test -Xswiftc "-target" -Xswiftc "x86_64-apple-macosx10.12"
	$(SWIFTLINT)
.PHONY: test

## run sourcery to generate code from the root templates
sourcery:
	$(SOURCERY)
.PHONY: sourcery

## run Sourcery in watch mode for live preview of templates
watch:
	$(SOURCERY) --watch
.PHONY: watch

## clean the project build artifacts
clean:
	swift package clean
.PHONY: clean

## generate the Xcode project without the custom build steps like Sourcery and Swiftlint
xcode_generate: sourcery
	swift package generate-xcodeproj $(SPM_XCODE_OPTIONS)
.PHONY: xcode_generate

## generate the Xcode project and open it
xcode_open: xcode_generate
	open AutoJSONSerialization.xcodeproj
.PHONY: xcode_open

## generate the Xcode project and run the tests using it
xcode_test: xcode_generate
	xcodebuild $(XCODEFLAGS) test
.PHONY: xcode_test

## setup the environment and run the tests using the Xcode generated project to generate code coverage
ci: test xcode_test
.PHONY: ci

.PHONY: release_pod_patch
## release a new patch version of the pod. See `fastlane lanes` for more information
release_pod_patch: check_pod_session
	bundle exec fastlane release_pod bump_type:patch

.PHONY: release_pod_minor
## release a new minor version of the pod. See `fastlane lanes` for more information
release_pod_minor: check_pod_session
	bundle exec fastlane release_pod bump_type:minor

.PHONY: release_pod_major
## release a new major version of the pod. See `fastlane lanes` for more information
release_pod_major: check_pod_session
	bundle exec fastlane release_pod bump_type:major

.PHONY: check_pod_session
# check if there is a registered pod session
check_pod_session: install
	@bundle exec pod trunk me --silent || (echo "You do not seem to have a valid session active on this device. Run 'pod trunk register' to create one."; exit 1)

.PHONY: download_tools
## Replace all binary tools with the version specified in the download scripts
download_tools: download_sourcery download_swiftlint

.PHONY: download_sourcery
## Replace sourcery binary with the version specified in the download script
download_sourcery:
	scripts/download_sourcery.sh

.PHONY: download_swiftlint
## Replace swiftlint binary with the version specified in the download script
download_swiftlint:
	scripts/download_swiftlint.sh

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
.PHONY: help
