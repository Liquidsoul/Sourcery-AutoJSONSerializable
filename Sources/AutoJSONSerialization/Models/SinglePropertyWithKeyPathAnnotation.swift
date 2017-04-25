struct SinglePropertyWithKeyPathAnnotation: AutoJSONDeserializable, AutoJSONSerializable {
    // sourcery: JSONKey = "label"
    let name: String
}
