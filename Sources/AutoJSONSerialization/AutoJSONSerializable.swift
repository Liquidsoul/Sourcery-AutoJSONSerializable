protocol AutoJSONSerializable {}

protocol JSONSerializable {
    func toJSONObject() -> Any
}
