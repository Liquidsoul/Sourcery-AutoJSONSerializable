SOURCERY=$(PWD)/.build/debug/sourcery

build:
	swift build

sourcery: build
	$(SOURCERY)

live: build
	$(SOURCERY) --watch

test: sourcery
	cd Tests; $(SOURCERY)
	swift test

clean:
	swift package clean

xcode: sourcery
	swift package generate-xcodeproj
	open AutoJSONSerializable.xcodeproj

.PHONY: build sourcery live test clean xcode
