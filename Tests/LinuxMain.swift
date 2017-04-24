// Generated using Sourcery 0.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable file_length
// swiftlint:disable line_length
// swiftlint:disable trailing_comma
import XCTest
@testable import AutoJSONDeserializableTests

extension AutoJSONDeserializableTests {
  static var allTests = [
    ("test_singlePropertyDeserialization", test_singlePropertyDeserialization),
    ("test_singleAnnotatedPropertyDeserialization", test_singleAnnotatedPropertyDeserialization),
    ("test_MultiTypesPropertiesDeserialization", test_MultiTypesPropertiesDeserialization),
    ("test_OptionalPropertyDeserialization", test_OptionalPropertyDeserialization),
    ("test_JSONDeserializablePropertyDeserialization", test_JSONDeserializablePropertyDeserialization),
    ("test_DatePropertyDeserialization", test_DatePropertyDeserialization),
  ]
}

XCTMain([
  testCase(AutoJSONDeserializableTests.allTests),
])
