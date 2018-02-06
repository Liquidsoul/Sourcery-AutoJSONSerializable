public enum AutoJSONDeserializableError: Error {
    public typealias KeyPath = [String]

    case typeMismatch(Any.Type, keyPath: KeyPath)
    case missingKeyOrInvalid(key: String, value: Any?)
    indirect case nestedError(key: String, error: AutoJSONDeserializableError)

    var keyPath: String {
        switch self {
        case .typeMismatch(_, let keyPath):
            return keyPath.joined(separator: ".")
        case .missingKeyOrInvalid(let key, _):
            return key
        case let .nestedError(key, error):
            return key + "." + error.keyPath
        }
    }

    public static func typeMismatchError(_ type: Any.Type, keyPath: KeyPath = []) -> AutoJSONDeserializableError {
        return .typeMismatch(type, keyPath: keyPath)
    }
}

public protocol JSONDeserializable {
    init(JSONObject: Any) throws
}
