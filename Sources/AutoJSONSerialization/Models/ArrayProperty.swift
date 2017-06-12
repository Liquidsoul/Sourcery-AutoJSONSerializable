import Foundation

struct ArrayProperty: AutoJSONDeserializable, AutoJSONSerializable {
    let array: [MultiTypesProperties]
}
