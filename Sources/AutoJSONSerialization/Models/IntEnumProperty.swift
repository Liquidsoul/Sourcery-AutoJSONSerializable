enum IntEnum: Int {
    case zero = 0
    case one
    case two
    case four = 4
}

struct IntEnumProperty: AutoJSONDeserializable {
    let enumValue: IntEnum
    let optionalEnumValue: IntEnum?
}
