enum StringEnum: String {
    case sameName
    case differentJSONValue
    case assignedValue = "assigned_value"
}

// sourcery: AutoJSONDeserializable, AutoJSONSerializable
struct StringEnumProperty {
    let enumValue: StringEnum
    let optionalEnumValue: StringEnum?
}
