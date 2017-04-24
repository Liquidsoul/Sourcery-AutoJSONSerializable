protocol AutoJSONSerializable {}

protocol JSONSerializable {
    func toJSONObject() -> [String: Any]
}
