// sourcery: AutoJSONDeserializable, AutoJSONSerializable
struct JSONDeserializableProperty {
    let entity: Entity
    let optionalEntity: Entity?
    let nilEntity: Entity?
    // sourcery: JSONKey = "annotated_entity"
    let annotatedEntity: Entity
    // sourcery: JSONKey = "optional_annotated_entity"
    let optionalAnnotatedEntity: Entity?

    // sourcery: AutoJSONDeserializable, AutoJSONSerializable
    struct Entity {
        let name: String
    }
}
