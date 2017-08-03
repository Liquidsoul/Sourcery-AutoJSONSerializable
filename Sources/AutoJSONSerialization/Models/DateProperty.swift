import Foundation

// sourcery: AutoJSONDeserializable, AutoJSONSerializable
struct DateProperty {
    let date: Date
    // sourcery: JSONKey = "optional_date"
    let optionalDate: Date?
}

typealias MomentInTime = Date

// sourcery: AutoJSONDeserializable, AutoJSONSerializable
struct TypealiasedDateProperty {
    let momentInTime: MomentInTime
    let optionalMomentInTime: MomentInTime?
}
