struct MultiTypesProperties: AutoJSONDeserializable, AutoJSONSerializable {
    let string: String
    let integer: Int
    let optionalInteger: Int?
    let double: Double
    let optionalDouble: Double?
}
