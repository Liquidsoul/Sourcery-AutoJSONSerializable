import Foundation

struct ArrayProperty: AutoJSONDeserializable, AutoJSONSerializable {
    let array: [MultiTypesProperties]
}

struct DateArrayProperty: AutoJSONDeserializable, AutoJSONSerializable {
    let dateArray: [Date]
}
