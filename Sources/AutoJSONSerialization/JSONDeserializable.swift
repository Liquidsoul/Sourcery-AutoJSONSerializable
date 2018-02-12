public enum AutoJSONDeserializableError: Error {
    public enum CodingKey {
        case name(String)
        case index(Int)

        func toString() -> String {
            switch self {
            case .name(let key):
                return key
            case .index(let index):
                return "\(index)"
            }
        }
    }

    public struct KeyPath {
        public var path = [CodingKey]()

        public func prepending(key: CodingKey) -> KeyPath {
            var keyPath = self
            keyPath.path = [key] + keyPath.path
            return keyPath
        }

        var stringValue: String {
            if path.isEmpty {
                return "$"
            }
            return "$." + path.map { $0.toString() }.joined(separator: ".")
        }
    }

    case typeMismatch(Any.Type, keyPath: KeyPath)
    case keyNotFound(String, keyPath: KeyPath)

    var keyPath: String {
        switch self {
        case .typeMismatch(_, let keyPath), .keyNotFound(_, let keyPath):
            return keyPath.stringValue
        }
    }

    public func nestedUnderKey(_ nestKey: CodingKey) -> AutoJSONDeserializableError {
        switch self {
        case let .typeMismatch(type, keyPath):
            return .typeMismatch(type, keyPath: keyPath.prepending(key: nestKey))
        case let .keyNotFound(key, keyPath):
            return .keyNotFound(key, keyPath: keyPath.prepending(key: nestKey))
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
