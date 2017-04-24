struct SinglePropertyWithKeyPathAnnotation: AutoJSONDeserializable, AutoJSONSerializable {
    // sourcery: keyName = "label"
    let name: String
}
