// swift-tools-version:3.1

import PackageDescription

let package = Package(
  name: "AutoJSONSerializable",
  dependencies: [
    .Package(url: "https://github.com/krzysztofzablocki/Sourcery.git", majorVersion: 0, minor: 6)
  ]
)
