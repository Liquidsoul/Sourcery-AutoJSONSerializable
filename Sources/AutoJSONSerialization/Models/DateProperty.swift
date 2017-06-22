import Foundation

struct DateProperty: AutoJSONDeserializable, AutoJSONSerializable {
    let date: Date
    // sourcery: JSONKey = "optional_date"
    let optionalDate: Date?
}

typealias MomentInTime = Date

struct TypealiasedDateProperty: AutoJSONDeserializable, AutoJSONSerializable {
    let momentInTime: MomentInTime
    let optionalMomentInTime: MomentInTime?
}
