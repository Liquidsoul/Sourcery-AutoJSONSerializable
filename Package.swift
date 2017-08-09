// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "AutoJSONSerialization",
  targets: [
    .target(name: "AutoJSONSerialization"),
    .testTarget(name: "AutoJSONSerializationTests", dependencies: ["AutoJSONSerialization"])
  ]
)
