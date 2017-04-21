struct JSONDeserializableProperty: AutoJSONDeserializable {
    let entity: Entity
    let optionalEntity: Entity?
    let nilEntity: Entity?
    // sourcery: keyName = "annotated_entity"
    let annotatedEntity: Entity
    // sourcery: keyName = "optional_annotated_entity"
    let optionalAnnotatedEntity: Entity?

    struct Entity: AutoJSONDeserializable {
        let name: String
    }
}
