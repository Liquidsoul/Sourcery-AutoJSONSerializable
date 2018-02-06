public enum AutoJSONDeserializableError: Error {
    case invalidJSONObject(Any)
    case missingKeyOrInvalid(key: String, value: Any?)
    indirect case nestedError(key: String, error: AutoJSONDeserializableError)

    var keyPath: String {
        switch self {
        case .invalidJSONObject:
            return ""
        case .missingKeyOrInvalid(let key, _):
            return key
        case let .nestedError(key, error):
            return key + "." + error.keyPath
        }
    }
}

public protocol JSONDeserializable {
    init(JSONObject: Any) throws
}
