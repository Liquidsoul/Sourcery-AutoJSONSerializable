enum StringEnum: String {
    case sameName
    case differentJSONValue
    case assignedValue = "assigned_value"
}

struct StringEnumProperty: AutoJSONDeserializable {
    let enumValue: StringEnum
    let optionalEnumValue: StringEnum?
}
