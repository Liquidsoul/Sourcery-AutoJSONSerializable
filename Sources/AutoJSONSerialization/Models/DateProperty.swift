import Foundation

struct DateProperty: AutoJSONDeserializable, AutoJSONSerializable {
    let date: Date
    // sourcery: keyName = "optional_date"
    let optionalDate: Date?
}
