import Foundation

// sourcery: AutoJSONDeserializable, AutoJSONSerializable
struct ArrayProperty {
    let array: [MultiTypesProperties]
}

// sourcery: AutoJSONDeserializable, AutoJSONSerializable
struct DateArrayProperty {
    let dateArray: [Date]
}

// sourcery: AutoJSONDeserializable, AutoJSONSerializable
struct TypealiasedDateArrayProperty {
    typealias Moment = Date
    let momentArray: [Moment]
}

// sourcery: AutoJSONDeserializable, AutoJSONSerializable
struct BasicTypesArrayProperty {
    let doubleArray: [Double]
    let integerArray: [Int]
    let stringArray: [String]
}

// sourcery: AutoJSONDeserializable, AutoJSONSerializable
struct EnumArrayProperty {
    let enumsArray: [StringEnum]
}
