enum StringEnum: String {
    case sameName
    case differentJSONValue
    case assignedValue = "assigned_value"
}

struct StringEnumProperty: AutoJSONSerializable, AutoJSONDeserializable {
    let enumValue: StringEnum
    let optionalEnumValue: StringEnum?
}
