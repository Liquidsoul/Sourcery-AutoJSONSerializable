import Foundation

struct DateProperty: AutoJSONDeserializable {
    let date: Date
    // sourcery: keyName = "optional_date"
    let optionalDate: Date?
}
