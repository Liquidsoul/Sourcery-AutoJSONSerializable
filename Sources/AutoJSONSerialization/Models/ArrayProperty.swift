import Foundation

struct ArrayProperty: AutoJSONDeserializable, AutoJSONSerializable {
    let array: [MultiTypesProperties]
}

struct DateArrayProperty: AutoJSONDeserializable, AutoJSONSerializable {
    let dateArray: [Date]
}

struct TypealiasedDateArrayProperty: AutoJSONDeserializable, AutoJSONSerializable {
    typealias Moment = Date
    let momentArray: [Moment]
}

struct BasicTypesArrayProperty: AutoJSONDeserializable, AutoJSONSerializable {
    let doubleArray: [Double]
    let integerArray: [Int]
    let stringArray: [String]
}
