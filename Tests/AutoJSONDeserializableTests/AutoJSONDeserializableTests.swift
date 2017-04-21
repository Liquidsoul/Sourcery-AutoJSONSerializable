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

     static var allTests = [
       ("test_singlePropertyDeserialization", test_singlePropertyDeserialization),
     ]
}
