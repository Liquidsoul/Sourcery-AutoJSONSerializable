struct JSONDeserializableProperty: AutoJSONDeserializable {
    let entity: Entity
    let optionalEntity: Entity?
    let nilEntity: Entity?

    struct Entity: AutoJSONDeserializable {
        let name: String
    }
}
