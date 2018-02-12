import XCTest
@testable import AutoJSONSerialization

class AutoJSONDeserializableTests: XCTestCase {
    func test_singlePropertyDeserialization() {
        let jsonObject: [String: Any] = ["name": "value"]

        guard let object = try? SinglePropertyNoAnnotation(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertEqual(object.name, "value")
    }

    func test_singlePropertyDeserialization_misspelledKey() {
        let jsonObject: [String: Any] = ["anme": "value"]

        do {
            _ = try SinglePropertyNoAnnotation(JSONObject: jsonObject)
        } catch let AutoJSONDeserializableError.keyNotFound(key, keyPath) {
            XCTAssertEqual(key, "name")
            XCTAssertEqual(keyPath.stringValue, "$")
        } catch {
            XCTFail("Unexpected error \(error)")
        }
    }

    func test_singlePropertyDeserialization_invalidValue() {
        let jsonObject: [String: Any] = ["name": 13]

        do {
            _ = try SinglePropertyNoAnnotation(JSONObject: jsonObject)
        } catch let AutoJSONDeserializableError.typeMismatch(type, keyPath) {
            XCTAssertEqual(keyPath.stringValue, "$.name")
            XCTAssertTrue(type == String.self)
        } catch {
            XCTFail("Unexpected error \(error)")
        }
    }

    func test_singleAnnotatedPropertyDeserialization() {
        let jsonObject: [String: Any] = ["label": "value"]

        guard let object = try? SinglePropertyWithKeyPathAnnotation(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertEqual(object.name, "value")
    }

    func test_MultiTypesPropertiesDeserialization() {
        let jsonObject: [String: Any] = [
          "string": "value",
          "integer": 42,
          "double": 66.6
        ]

        guard let object = try? MultiTypesProperties(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertEqual(object.string, "value")
        XCTAssertEqual(object.integer, 42)
        XCTAssertEqual(object.double, 66.6)
    }

    func test_OptionalPropertyDeserialization() {
        let jsonObject: [String: Any] = ["name": NSNull()]

        guard let object = try? OptionalProperty(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertNil(object.name)
    }

    func test_JSONDeserializablePropertyDeserialization() {
        let jsonObject: [String: Any] = [
          "entity": ["name": "value"],
          "optionalEntity": ["name": "optionalValue"],
          "annotated_entity": ["name": "annotatedValue"],
          "optional_annotated_entity": ["name": "optionalAnnotatedValue"]
        ]

        guard let object = try? JSONDeserializableProperty(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertEqual(object.entity.name, "value")
        XCTAssertEqual(object.optionalEntity?.name, "optionalValue")
        XCTAssertEqual(object.annotatedEntity.name, "annotatedValue")
        XCTAssertEqual(object.optionalAnnotatedEntity?.name, "optionalAnnotatedValue")
        XCTAssertNil(object.nilEntity)
    }

    func test_JSONDeserializablePropertyDeserialization_misspelledNestedAttribute() throws {
        let jsonObject: [String: Any] = [
            "entity": ["name": "value"],
            "optionalEntity": ["name": "optionalValue"],
            "annotated_entity": ["anme": "annotatedValue"],
            "optional_annotated_entity": ["name": "optionalAnnotatedValue"]
        ]

        do {
            _ = try JSONDeserializableProperty(JSONObject: jsonObject)
        } catch let AutoJSONDeserializableError.keyNotFound(key, keyPath) {
            XCTAssertEqual(key, "name")
            XCTAssertEqual(keyPath.stringValue, "$.annotated_entity")
        } catch {
            XCTFail("Unexpected error \(error)")
        }
    }

    func test_DatePropertyDeserialization() {
        let jsonObject: [String: Any] = [
          "date": "1985-04-12T23:20:50Z",
          "optional_date": "1996-12-19T16:39:57-08:00"
        ]

        guard let object = try? DateProperty(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertEqual(object.date, Date(timeIntervalSince1970: 482196050))
        XCTAssertEqual(object.optionalDate, Date(timeIntervalSince1970: 851042397))
    }

    func test_TypealiasedDatePropertyDeserialization() {
        let jsonObject: [String: Any] = [
          "momentInTime": "1985-04-12T23:20:50Z",
          "optionalMomentInTime": "1996-12-19T16:39:57-08:00"
        ]

        guard let object = try? TypealiasedDateProperty(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertEqual(object.momentInTime, Date(timeIntervalSince1970: 482196050))
        XCTAssertEqual(object.optionalMomentInTime, Date(timeIntervalSince1970: 851042397))
    }

    func test_ArrayPropertyDeserialization() {
        let jsonObject: [String: Any] = [
          "array": [
            [
              "string": "value",
              "integer": 42,
              "optionalInteger": 24,
              "double": 66.6
            ]
          ]
        ]

        guard let object = try? ArrayProperty(JSONObject: jsonObject), let firstItem = object.array.first else {
            XCTFail()
            return
        }
        XCTAssertEqual(firstItem.string, "value")
        XCTAssertEqual(firstItem.integer, 42)
        XCTAssertEqual(firstItem.optionalInteger, 24)
        XCTAssertEqual(firstItem.double, 66.6)
    }

    func test_DateArrayPropertyDeserialization() {
        let jsonObject: [String: Any] = [
          "dateArray": ["1985-04-12T23:20:50Z"]
        ]
        let expectedItem = Date(timeIntervalSince1970: 482196050)

        guard let object = try? DateArrayProperty(JSONObject: jsonObject), let firstItem = object.dateArray.first else {
            XCTFail()
            return
        }
        XCTAssertEqual(firstItem, expectedItem)
    }

    func test_TypealiasedDateArrayPropertyDeserialization() {
        let jsonObject: [String: Any] = [
          "momentArray": ["1985-04-12T23:20:50Z"]
        ]
        let expectedItem = Date(timeIntervalSince1970: 482196050)

        guard let object = try? TypealiasedDateArrayProperty(JSONObject: jsonObject),
              let firstItem = object.momentArray.first else {
            XCTFail()
            return
        }
        XCTAssertEqual(firstItem, expectedItem)
    }

    func test_BasicTypesArrayPropertyDeserialization() {
        let jsonObject: [String: Any] = [
          "doubleArray": [1.2, 3.4],
          "integerArray": [1, 2, 3, 4],
          "stringArray": ["A", "B", "C"]
        ]

        guard let object = try? BasicTypesArrayProperty(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertEqual(object.doubleArray, [1.2, 3.4])
        XCTAssertEqual(object.integerArray, [1, 2, 3, 4])
        XCTAssertEqual(object.stringArray, ["A", "B", "C"])
    }

    func test_that_arrayDeserializationFailsEntirely_ifOneItemCannotBeDeserialized() {
        let jsonObject = [
            "array": [
                [
                    "string": "value",
                    "integer": 42,
                    "optionalInteger": 24,
                    "double": 66.6
                ],
                [
                    "string": "failing",
                    "integer": "42",
                    "optionalInteger": 24,
                    "double": 66.6
                ],
                [
                    "string": "otherValue",
                    "integer": 24,
                    "optionalInteger": 42,
                    "double": 9.99
                ]
            ]
        ]

        XCTAssertThrowsError(try ArrayProperty(JSONObject: jsonObject)) { error in
            XCTAssertEqual((error as? AutoJSONDeserializableError)?.keyPath, "$.array[1].integer")
        }
    }

    func test_StringEnumPropertyDeserialization() {
        let jsonObject: Any = [
          "enumValue": "sameName",
          "optionalEnumValue": "assigned_value"
        ]

        guard let object = try? StringEnumProperty(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertEqual(StringEnum.sameName, object.enumValue)
        XCTAssertEqual(StringEnum.assignedValue, object.optionalEnumValue)
    }

    func test_IntEnumPropertyDeserialization() {
        let jsonObject: Any = [
          "enumValue": 2,
          "optionalEnumValue": 4
        ]

        guard let object = try? IntEnumProperty(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertEqual(IntEnum.two, object.enumValue)
        XCTAssertEqual(IntEnum.four, object.optionalEnumValue)
    }

    func test_EnumArrayPropertyDeserialization() {
        let jsonObject: [String: Any] = [
          "enumsArray": ["sameName", "assigned_value"]
        ]

        guard let object = try? EnumArrayProperty(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertEqual(StringEnum.sameName, object.enumsArray.first)
        XCTAssertEqual(StringEnum.assignedValue, object.enumsArray.last)
    }

    func test_EnumWithCustomSerdePropertiesDeserialization() {
        let jsonObject: Any = [
          "intEnumUsingStringSerde": "6",
          "customSerdeEnum": "human|Bruce|Wayne",
          "optionalCustomSerdeEnum": "chair"
        ]

        guard let object = try? EnumWithCustomSerdeProperties(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertEqual(IntEnumUsingStringSerde.six, object.intEnumUsingStringSerde)
        XCTAssertEqual(CustomSerdeEnum.human(firstName: "Bruce", lastName: "Wayne"), object.customSerdeEnum)
        XCTAssertEqual(CustomSerdeEnum.chair, object.optionalCustomSerdeEnum)
    }

}
