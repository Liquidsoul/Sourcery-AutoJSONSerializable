import XCTest
@testable import AutoJSONSerialization

class AutoJSONDeserializableTests: XCTestCase {
    func test_singlePropertyDeserialization() {
        let jsonObject: [String: Any] = ["name": "value"]

        guard let object = SinglePropertyNoAnnotation(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertEqual(object.name, "value")
    }

    func test_singleAnnotatedPropertyDeserialization() {
        let jsonObject: [String: Any] = ["label": "value"]

        guard let object = SinglePropertyWithKeyPathAnnotation(JSONObject: jsonObject) else {
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

        guard let object = MultiTypesProperties(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertEqual(object.string, "value")
        XCTAssertEqual(object.integer, 42)
        XCTAssertEqual(object.double, 66.6)
    }

    func test_OptionalPropertyDeserialization() {
        let jsonObject: [String: Any] = ["name": NSNull()]

        guard let object = OptionalProperty(JSONObject: jsonObject) else {
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

        guard let object = JSONDeserializableProperty(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertEqual(object.entity.name, "value")
        XCTAssertEqual(object.optionalEntity?.name, "optionalValue")
        XCTAssertEqual(object.annotatedEntity.name, "annotatedValue")
        XCTAssertEqual(object.optionalAnnotatedEntity?.name, "optionalAnnotatedValue")
        XCTAssertNil(object.nilEntity)
    }

    func test_DatePropertyDeserialization() {
        let jsonObject: [String: Any] = [
          "date": "1985-04-12T23:20:50Z",
          "optional_date": "1996-12-19T16:39:57-08:00"
        ]

        guard let object = DateProperty(JSONObject: jsonObject) else {
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

        guard let object = TypealiasedDateProperty(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertEqual(object.momentInTime, Date(timeIntervalSince1970: 482196050))
        XCTAssertEqual(object.optionalMomentInTime, Date(timeIntervalSince1970: 851042397))
    }

    func test_ArrayPropertySerialization() {
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

        guard let object = ArrayProperty(JSONObject: jsonObject), let firstItem = object.array.first else {
            XCTFail()
            return
        }
        XCTAssertEqual(firstItem.string, "value")
        XCTAssertEqual(firstItem.integer, 42)
        XCTAssertEqual(firstItem.optionalInteger, 24)
        XCTAssertEqual(firstItem.double, 66.6)
    }

    func test_DateArrayPropertySerialization() {
        let jsonObject: [String: Any] = [
          "dateArray": ["1985-04-12T23:20:50Z"]
        ]
        let expectedItem = Date(timeIntervalSince1970: 482196050)

        guard let object = DateArrayProperty(JSONObject: jsonObject), let firstItem = object.dateArray.first else {
            XCTFail()
            return
        }
        XCTAssertEqual(firstItem, expectedItem)
    }

    func test_BasicTypesArrayPropertySerialization() {
        let jsonObject: [String: Any] = [
          "doubleArray": [1.2, 3.4],
          "integerArray": [1, 2, 3, 4],
          "stringArray": ["A", "B", "C"]
        ]

        guard let object = BasicTypesArrayProperty(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertEqual(object.doubleArray, [1.2, 3.4])
        XCTAssertEqual(object.integerArray, [1, 2, 3, 4])
        XCTAssertEqual(object.stringArray, ["A", "B", "C"])
    }

}
