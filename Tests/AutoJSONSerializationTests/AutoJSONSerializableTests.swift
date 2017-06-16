import XCTest
@testable import AutoJSONSerialization

class AutoJSONSerializableTests: XCTestCase {
    func test_singlePropertySerialization() {
        let object = SinglePropertyNoAnnotation(name: "value")
        let jsonObject: [String: Any] = ["name": "value"]

        XCTAssertEqual(toString(object.toJSONObject()), toString(jsonObject))
    }

    func test_singleAnnotatedPropertySerialization() {
        let object = SinglePropertyWithKeyPathAnnotation(name: "value")
        let jsonObject: [String: Any] = ["label": "value"]

        XCTAssertEqual(toString(object.toJSONObject()), toString(jsonObject))
    }

    func test_MultiTypesPropertiesSerialization() {
        let object = MultiTypesProperties(string: "value",
                                          integer: 42,
                                          optionalInteger: 24,
                                          double: 66.6,
                                          optionalDouble: nil)
        let jsonObject: [String: Any] = [
          "string": "value",
          "integer": 42,
          "optionalInteger": 24,
          "double": 66.6
        ]

        XCTAssertEqual(toString(object.toJSONObject()), toString(jsonObject))
    }

    func test_OptionalPropertySerialization() {
        let object = OptionalProperty(name: nil)
        let jsonObject = [String: Any]()

        XCTAssertEqual(toString(object.toJSONObject()), toString(jsonObject))
    }

    func test_JSONSerializablePropertySerialization() {
        let wholeEntity = JSONDeserializableProperty.Entity(name: "value")
        let optionalEntity = JSONDeserializableProperty.Entity(name: "optionalValue")
        let annotatedEntity = JSONDeserializableProperty.Entity(name: "annotatedValue")
        let optionalAnnotatedEntity = JSONDeserializableProperty.Entity(name: "optionalAnnotatedValue")
        let object = JSONDeserializableProperty(entity: wholeEntity,
                                              optionalEntity: optionalEntity,
                                              nilEntity: nil,
                                              annotatedEntity: annotatedEntity,
                                              optionalAnnotatedEntity: optionalAnnotatedEntity)
        let jsonObject: [String: Any] = [
          "entity": ["name": "value"],
          "optionalEntity": ["name": "optionalValue"],
          "annotated_entity": ["name": "annotatedValue"],
          "optional_annotated_entity": ["name": "optionalAnnotatedValue"]
        ]

        XCTAssertEqual(toString(object.toJSONObject()), toString(jsonObject))
    }

    func test_DatePropertySerialization() {
        let object = DateProperty(date: Date(timeIntervalSince1970: 482196050),
                                  optionalDate: Date(timeIntervalSince1970: 851042397))
        let jsonObject: [String: Any] = [
          "date": "1985-04-12T23:20:50Z",
          "optional_date": "1996-12-20T00:39:57Z"
        ]

        XCTAssertEqual(toString(object.toJSONObject()), toString(jsonObject))
    }

    func test_TypealiasedDatePropertySerialization() {
        let object = TypealiasedDateProperty(momentInTime: Date(timeIntervalSince1970: 482196050),
                                             optionalMomentInTime: Date(timeIntervalSince1970: 851042397))
        let jsonObject: [String: Any] = [
          "momentInTime": "1985-04-12T23:20:50Z",
          "optionalMomentInTime": "1996-12-20T00:39:57Z"
        ]

        XCTAssertEqual(toString(object.toJSONObject()), toString(jsonObject))
    }

    func test_ArrayPropertySerialization() {
        let arrayItem = MultiTypesProperties(string: "value",
                                             integer: 42,
                                             optionalInteger: 24,
                                             double: 66.6,
                                             optionalDouble: nil)
        let object = ArrayProperty(array: [arrayItem])
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

        XCTAssertEqual(toString(object.toJSONObject()), toString(jsonObject))
    }

    func test_DateArrayPropertySerialization() {
        let arrayItem = Date(timeIntervalSince1970: 482196050)
        let object = DateArrayProperty(dateArray: [arrayItem])
        let jsonObject: [String: Any] = [
          "dateArray": ["1985-04-12T23:20:50Z"]
        ]

        XCTAssertEqual(toString(object.toJSONObject()), toString(jsonObject))
    }

    func test_TypealiasedDateArrayPropertySerialization() {
        let arrayItem = Date(timeIntervalSince1970: 482196050)
        let object = TypealiasedDateArrayProperty(momentArray: [arrayItem])
        let jsonObject: [String: Any] = [
          "momentArray": ["1985-04-12T23:20:50Z"]
        ]

        XCTAssertEqual(toString(object.toJSONObject()), toString(jsonObject))
    }

    func test_BasicTypesArrayPropertySerialization() {
        let object = BasicTypesArrayProperty(doubleArray: [1.2, 3.4],
                                             integerArray: [1, 2, 3, 4],
                                             stringArray: ["A", "B", "C"])
        let jsonObject: [String: Any] = [
          "doubleArray": [1.2, 3.4],
          "integerArray": [1, 2, 3, 4],
          "stringArray": ["A", "B", "C"]
        ]

        XCTAssertEqual(toString(object.toJSONObject()), toString(jsonObject))
    }

    func toString(_ JSONObject: Any) -> String? {
        return (try? JSONSerialization.data(withJSONObject: JSONObject)).flatMap({String(data: $0, encoding: .utf8)})
    }
}
