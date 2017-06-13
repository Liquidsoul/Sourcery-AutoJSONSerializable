import Foundation

struct ArrayProperty: AutoJSONDeserializable, AutoJSONSerializable {
    let array: [MultiTypesProperties]
}

struct DateArrayProperty: AutoJSONSerializable {
    let dateArray: [Date]
}
