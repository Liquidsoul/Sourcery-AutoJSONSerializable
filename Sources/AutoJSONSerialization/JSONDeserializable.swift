public enum AutoJSONDeserializableError: Error {
    public typealias CodingKey = String
    public typealias KeyPath = [CodingKey]

    case typeMismatch(Any.Type, keyPath: KeyPath)
    case keyNotFound(String, keyPath: KeyPath)

    var keyPath: String {
        switch self {
        case .typeMismatch(_, let keyPath), .keyNotFound(_, let keyPath):
            return keyPath.joined(separator: ".")
        }
    }

    public func nestedUnderKey(_ nestKey: CodingKey) -> AutoJSONDeserializableError {
        switch self {
        case let .typeMismatch(type, keyPath):
            return .typeMismatch(type, keyPath: [nestKey] + keyPath)
        case let .keyNotFound(key, keyPath):
            return .keyNotFound(key, keyPath: [nestKey] + keyPath)
        }
    }

    public static func typeMismatchError(_ type: Any.Type) -> AutoJSONDeserializableError {
        return .typeMismatch(type, keyPath: KeyPath())
    }

    public static func keyNotFoundError(_ key: String) -> AutoJSONDeserializableError {
        return .keyNotFound(key, keyPath: KeyPath())
    }
}

public protocol JSONDeserializable {
    init(JSONObject: Any) throws
}
