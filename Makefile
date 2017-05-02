.DEFAULT_GOAL := test

SOURCERY=$(PWD)/.build/release/sourcery

# install dependencies
install:
	brew bundle

# build the project and run the tests
test: sourcery
	cd Tests; $(SOURCERY)
	swift test
	swiftlint

# run sourcery to generate code from the root templates
sourcery: $(SOURCERY)
	$(SOURCERY)

# run Sourcery in watch mode for live preview of templates
watch: $(SOURCERY)
	$(SOURCERY) --watch

# clean the project build artifacts
clean:
	swift package clean

# generate an Xcode project
# This will lacks some build steps like Sourcery and Swiftlint
xcode: sourcery
	swift package generate-xcodeproj
	open AutoJSONSerialization.xcodeproj

XCODEFLAGS=-project 'AutoJSONSerialization.xcodeproj' \
				-scheme 'AutoJSONSerialization' \
				-enableCodeCoverage YES

ci: install test
	swift package generate-xcodeproj
	xcodebuild $(XCODEFLAGS) test

$(SOURCERY):
	swift build -c release

.PHONY: install sourcery watch test clean xcode ci
