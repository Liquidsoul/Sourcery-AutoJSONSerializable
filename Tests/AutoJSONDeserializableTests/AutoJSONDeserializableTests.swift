import XCTest
@testable import AutoJSONDeserializable

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

    func test_OptionalPropertyDeserialization() {
        let jsonObject: [String: Any] = ["name": NSNull()]

        guard let object = OptionalProperty(JSONObject: jsonObject) else {
            XCTFail()
            return
        }
        XCTAssertNil(object.name)
    }
}
