build:
	swift build

sourcery: build
	.build/debug/sourcery

live: build
	.build/debug/sourcery --watch

test: sourcery
	swift test

clean:
	swift package clean

xcode: sourcery
	swift package generate-xcodeproj
	open AutoJSONSerializable.xcodeproj

.PHONY: build sourcery live test clean xcode
