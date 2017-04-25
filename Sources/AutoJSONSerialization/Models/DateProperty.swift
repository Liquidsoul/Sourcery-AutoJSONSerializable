import Foundation

struct DateProperty: AutoJSONDeserializable, AutoJSONSerializable {
    let date: Date
    // sourcery: JSONKey = "optional_date"
    let optionalDate: Date?
}
