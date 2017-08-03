enum IntEnumUsingStringSerde: Int, JSONSerializable, JSONDeserializable {
    case one = 0
    case two
    case six = 6

    init?(JSONObject: Any) {
        guard let stringValue = JSONObject as? String, let intValue = Int(stringValue) else { return nil }
        self.init(rawValue: intValue)
    }

    func toJSONObject() -> Any {
        return "\(rawValue)"
    }
}

enum CustomSerdeEnum: JSONSerializable, JSONDeserializable {
    case chair
    case human(firstName: String, lastName: String)

    init?(JSONObject: Any) {
        guard let stringValue = JSONObject as? String else {
            return nil
        }
        var components = stringValue.components(separatedBy: "|")
        guard let type = components.first else { return nil }
        components.removeFirst()
        switch type {
        case "chair": self = .chair
        case "human":
            guard let firstName = components.first, let lastName = components.last else {
                return nil
            }
            self = .human(firstName: firstName, lastName: lastName)
        default: return nil
        }
    }

    func toJSONObject() -> Any {
        switch self {
        case .chair: return "chair"
        case let .human(firstName, lastName): return "human|\(firstName)|\(lastName)"
        }
    }
}

extension CustomSerdeEnum: Equatable {
    public static func == (lhs: CustomSerdeEnum, rhs: CustomSerdeEnum) -> Bool {
        switch (lhs, rhs) {
        case (.chair, .chair): return true
        case let (.human(lhsFirstName, lhsLastName), .human(rhsFirstName, rhsLastName)):
            return lhsFirstName == rhsFirstName && lhsLastName == rhsLastName
        default: return false
        }
    }
}

// sourcery: AutoJSONDeserializable, AutoJSONSerializable
struct EnumWithCustomSerdeProperties {
    let intEnumUsingStringSerde: IntEnumUsingStringSerde
    let customSerdeEnum: CustomSerdeEnum
    let optionalCustomSerdeEnum: CustomSerdeEnum?
}
