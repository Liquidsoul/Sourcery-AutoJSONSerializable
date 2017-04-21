struct JSONDeserializableProperty: AutoJSONDeserializable {
    let entity: Entity
    let optionalEntity: Entity?
    let nilEntity: Entity?
    // sourcery: keyName = "annotated_entity"
    let annotatedEntity: Entity

    struct Entity: AutoJSONDeserializable {
        let name: String
    }
}
