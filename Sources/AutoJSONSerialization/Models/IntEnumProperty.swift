enum IntEnum: Int {
    case zero = 0
    case one
    case two
    case four = 4
}

// sourcery: AutoJSONDeserializable, AutoJSONSerializable
struct IntEnumProperty {
    let enumValue: IntEnum
    let optionalEnumValue: IntEnum?
}
