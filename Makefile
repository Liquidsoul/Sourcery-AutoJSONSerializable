.DEFAULT_GOAL := test

SOURCERY=$(PWD)/.build/release/sourcery

$(SOURCERY):
	swift build -c release

sourcery: $(SOURCERY)
	$(SOURCERY)

live: $(SOURCERY)
	$(SOURCERY) --watch

test: sourcery
	cd Tests; $(SOURCERY)
	swift test

clean:
	swift package clean

xcode: sourcery
	swift package generate-xcodeproj
	open AutoJSONSerializable.xcodeproj

.PHONY: sourcery live test clean xcode
