public protocol AutoJSONSerializable {}

public protocol JSONSerializable {
    func toJSONObject() -> Any
}
