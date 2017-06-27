import XCTest
@testable import AutoJSONSerialization

class JSONDateFormatterTests: XCTestCase {
    func test_dateFromString() {
        let expectedDate = Date(timeIntervalSince1970: 482196050)

        let dateStrings = [
          "1985-04-12T23:20:50Z",
          "1985-04-12T22:20:50-01:00",
          "1985-04-12T23:20:50.678Z",
          "1985-04-12T22:20:50.467-01:00"
        ]

        dateStrings.forEach { dateString in
            XCTAssertEqual(expectedDate,
                           JSONDateFormatter.date(from: dateString),
                           "Failed to correctly parse '\(dateString)'")
        }
    }

}
