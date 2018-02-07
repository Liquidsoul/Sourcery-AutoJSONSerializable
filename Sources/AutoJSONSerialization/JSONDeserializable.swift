public enum AutoJSONDeserializableError: Error {
    case invalidJSONObject(Any)
    case missingKeyOrInvalid(key: String, value: Any?)
}

public protocol JSONDeserializable {
    init(JSONObject: Any) throws
}
