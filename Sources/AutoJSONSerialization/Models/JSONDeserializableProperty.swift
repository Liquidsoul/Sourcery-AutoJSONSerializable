struct JSONDeserializableProperty: AutoJSONDeserializable, AutoJSONSerializable {
    let entity: Entity
    let optionalEntity: Entity?
    let nilEntity: Entity?
    // sourcery: JSONKey = "annotated_entity"
    let annotatedEntity: Entity
    // sourcery: JSONKey = "optional_annotated_entity"
    let optionalAnnotatedEntity: Entity?

    struct Entity: AutoJSONDeserializable, AutoJSONSerializable {
        let name: String
    }
}
