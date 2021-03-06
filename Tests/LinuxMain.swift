// Generated using Sourcery 0.7.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable file_length
// swiftlint:disable line_length
// swiftlint:disable trailing_comma
import XCTest
@testable import AutoJSONSerializationTests

extension AutoJSONDeserializableTests {
  static var allTests = [
    ("test_singlePropertyDeserialization", test_singlePropertyDeserialization),
    ("test_singlePropertyDeserialization_misspelledKey", test_singlePropertyDeserialization_misspelledKey),
    ("test_singlePropertyDeserialization_invalidValue", test_singlePropertyDeserialization_invalidValue),
    ("test_singleAnnotatedPropertyDeserialization", test_singleAnnotatedPropertyDeserialization),
    ("test_MultiTypesPropertiesDeserialization", test_MultiTypesPropertiesDeserialization),
    ("test_OptionalPropertyDeserialization", test_OptionalPropertyDeserialization),
    ("test_JSONDeserializablePropertyDeserialization", test_JSONDeserializablePropertyDeserialization),
    ("test_JSONDeserializablePropertyDeserialization_misspelledNestedAttribute", test_JSONDeserializablePropertyDeserialization_misspelledNestedAttribute),
    ("test_DatePropertyDeserialization", test_DatePropertyDeserialization),
    ("test_TypealiasedDatePropertyDeserialization", test_TypealiasedDatePropertyDeserialization),
    ("test_ArrayPropertyDeserialization", test_ArrayPropertyDeserialization),
    ("test_DateArrayPropertyDeserialization", test_DateArrayPropertyDeserialization),
    ("test_TypealiasedDateArrayPropertyDeserialization", test_TypealiasedDateArrayPropertyDeserialization),
    ("test_BasicTypesArrayPropertyDeserialization", test_BasicTypesArrayPropertyDeserialization),
    ("test_that_arrayDeserializationFailsEntirely_ifOneItemCannotBeDeserialized", test_that_arrayDeserializationFailsEntirely_ifOneItemCannotBeDeserialized),
    ("test_StringEnumPropertyDeserialization", test_StringEnumPropertyDeserialization),
    ("test_IntEnumPropertyDeserialization", test_IntEnumPropertyDeserialization),
    ("test_EnumArrayPropertyDeserialization", test_EnumArrayPropertyDeserialization),
    ("test_EnumWithCustomSerdePropertiesDeserialization", test_EnumWithCustomSerdePropertiesDeserialization),
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
    ("test_TypealiasedDatePropertySerialization", test_TypealiasedDatePropertySerialization),
    ("test_ArrayPropertySerialization", test_ArrayPropertySerialization),
    ("test_DateArrayPropertySerialization", test_DateArrayPropertySerialization),
    ("test_TypealiasedDateArrayPropertySerialization", test_TypealiasedDateArrayPropertySerialization),
    ("test_BasicTypesArrayPropertySerialization", test_BasicTypesArrayPropertySerialization),
    ("test_StringEnumPropertySerialization", test_StringEnumPropertySerialization),
    ("test_IntEnumPropertySerialization", test_IntEnumPropertySerialization),
    ("test_EnumArrayPropertySerialization", test_EnumArrayPropertySerialization),
    ("test_EnumWithCustomSerdePropertiesSerialization", test_EnumWithCustomSerdePropertiesSerialization),
  ]
}
extension JSONDateFormatterTests {
  static var allTests = [
    ("test_dateFromString", test_dateFromString),
  ]
}

XCTMain([
  testCase(AutoJSONDeserializableTests.allTests),
  testCase(AutoJSONSerializableTests.allTests),
  testCase(JSONDateFormatterTests.allTests),
])
