import Foundation

// sourcery: AutoJSONDeserializable, AutoJSONSerializable
struct TypealiasedDateArrayProperty {
    typealias Moment = Date
    let momentArray: [Moment]
}
