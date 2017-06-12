// Generated using Sourcery 0.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable file_length
// swiftlint:disable line_length
// swiftlint:disable trailing_comma
import XCTest
@testable import AutoJSONSerializationTests

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
extension AutoJSONSerializableTests {
  static var allTests = [
    ("test_singlePropertySerialization", test_singlePropertySerialization),
    ("test_singleAnnotatedPropertySerialization", test_singleAnnotatedPropertySerialization),
    ("test_MultiTypesPropertiesSerialization", test_MultiTypesPropertiesSerialization),
    ("test_OptionalPropertySerialization", test_OptionalPropertySerialization),
    ("test_JSONSerializablePropertySerialization", test_JSONSerializablePropertySerialization),
    ("test_DatePropertySerialization", test_DatePropertySerialization),
    ("test_ArrayPropertySerialization", test_ArrayPropertySerialization),
  ]
}

XCTMain([
  testCase(AutoJSONDeserializableTests.allTests),
  testCase(AutoJSONSerializableTests.allTests),
])
