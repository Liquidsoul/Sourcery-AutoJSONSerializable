public protocol AutoJSONDeserializable {}

public protocol JSONDeserializable {
    init?(JSONObject: Any)
}
