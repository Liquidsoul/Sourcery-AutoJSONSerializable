public protocol JSONDeserializable {
    init(JSONObject: Any) throws
}

public enum AutoJSONDeserializableError: Error {
    public enum CodingKey {
        case name(String)
        case index(Int)

        func toString() -> String {
            switch self {
            case .name(let key):
                return "." + key
            case .index(let index):
                return "[\(index)]"
            }
        }
    }

    public struct KeyPath {
        public var path = [CodingKey]()

        public init(path: [CodingKey] = []) {
            self.path = path
        }

        public init(key: CodingKey) {
            self.path = [key]
        }

        public func prepending(key: CodingKey) -> KeyPath {
            var keyPath = self
            keyPath.path = [key] + keyPath.path
            return keyPath
        }

        var stringValue: String {
            if path.isEmpty {
                return "$"
            }
            return "$" + path.map { $0.toString() }.joined()
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

    public static func typeMismatchError(_ type: Any.Type,
                                         keyPath: KeyPath = KeyPath()) -> AutoJSONDeserializableError {
        return .typeMismatch(type, keyPath: keyPath)
    }

    public static func keyNotFoundError(_ key: String, keyPath: KeyPath = KeyPath()) -> AutoJSONDeserializableError {
        return .keyNotFound(key, keyPath: keyPath)
    }
}

import Foundation

extension AutoJSONDeserializableError: LocalizedError {
    public var failureReason: String? {
        switch self {
        case let .typeMismatch(type, keyPath):
            return "Incorrect type (expected \(type)) at path \(keyPath.stringValue)"
        case let .keyNotFound(key, keyPath):
            return "Key '\(key)' not found at path \(keyPath.stringValue)"
        }
    }
}
