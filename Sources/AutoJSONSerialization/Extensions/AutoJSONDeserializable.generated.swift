// Generated using Sourcery 0.7.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable cyclomatic_complexity file_length function_body_length line_length

import Foundation

// MARK: - AutoJSONDeserializable for classes, protocols, structs

// MARK: - ArrayProperty AutoJSONDeserializable
extension ArrayProperty: JSONDeserializable {
    internal init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any] else { return nil }
        guard let array = (JSONObject["array"] as? [Any])?.flatMap(MultiTypesProperties.init(JSONObject:)) else { return nil }
        self.array = array
    }
}

// MARK: - BasicTypesArrayProperty AutoJSONDeserializable
extension BasicTypesArrayProperty: JSONDeserializable {
    internal init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any] else { return nil }
        guard let doubleArray = (JSONObject["doubleArray"] as? [Double]) else { return nil }
        self.doubleArray = doubleArray
        guard let integerArray = (JSONObject["integerArray"] as? [Int]) else { return nil }
        self.integerArray = integerArray
        guard let stringArray = (JSONObject["stringArray"] as? [String]) else { return nil }
        self.stringArray = stringArray
    }
}

// MARK: - DateArrayProperty AutoJSONDeserializable
extension DateArrayProperty: JSONDeserializable {
    internal init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any] else { return nil }
        guard let dateArray = (JSONObject["dateArray"] as? [Any])?.flatMap(Date.init(JSONObject:)) else { return nil }
        self.dateArray = dateArray
    }
}

// MARK: - DateProperty AutoJSONDeserializable
extension DateProperty: JSONDeserializable {
    internal init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any] else { return nil }
        guard let date = (JSONObject["date"]).flatMap(Date.init(JSONObject:)) else { return nil }
        self.date = date
        let optionalDate = (JSONObject["optional_date"]).flatMap(Date.init(JSONObject:))
        self.optionalDate = optionalDate
    }
}

// MARK: - EnumArrayProperty AutoJSONDeserializable
extension EnumArrayProperty: JSONDeserializable {
    internal init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any] else { return nil }
        guard let enumsArray = (JSONObject["enumsArray"] as? [String])?.flatMap({ StringEnum(rawValue: $0) }) else { return nil }
        self.enumsArray = enumsArray
    }
}

// MARK: - EnumWithCustomSerdeProperties AutoJSONDeserializable
extension EnumWithCustomSerdeProperties: JSONDeserializable {
    internal init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any] else { return nil }
        guard let intEnumUsingStringSerde = (JSONObject["intEnumUsingStringSerde"]).flatMap(IntEnumUsingStringSerde.init(JSONObject:)) else { return nil }
        self.intEnumUsingStringSerde = intEnumUsingStringSerde
        guard let customSerdeEnum = (JSONObject["customSerdeEnum"]).flatMap(CustomSerdeEnum.init(JSONObject:)) else { return nil }
        self.customSerdeEnum = customSerdeEnum
        let optionalCustomSerdeEnum = (JSONObject["optionalCustomSerdeEnum"]).flatMap(CustomSerdeEnum.init(JSONObject:))
        self.optionalCustomSerdeEnum = optionalCustomSerdeEnum
    }
}

// MARK: - IntEnumProperty AutoJSONDeserializable
extension IntEnumProperty: JSONDeserializable {
    internal init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any] else { return nil }
        guard let enumValue = (JSONObject["enumValue"] as? Int).flatMap({ IntEnum(rawValue: $0) }) else { return nil }
        self.enumValue = enumValue
        let optionalEnumValue = (JSONObject["optionalEnumValue"] as? Int).flatMap({ IntEnum(rawValue: $0) })
        self.optionalEnumValue = optionalEnumValue
    }
}

// MARK: - JSONDeserializableProperty AutoJSONDeserializable
extension JSONDeserializableProperty: JSONDeserializable {
    internal init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any] else { return nil }
        guard let entity = (JSONObject["entity"]).flatMap(Entity.init(JSONObject:)) else { return nil }
        self.entity = entity
        let optionalEntity = (JSONObject["optionalEntity"]).flatMap(Entity.init(JSONObject:))
        self.optionalEntity = optionalEntity
        let nilEntity = (JSONObject["nilEntity"]).flatMap(Entity.init(JSONObject:))
        self.nilEntity = nilEntity
        guard let annotatedEntity = (JSONObject["annotated_entity"]).flatMap(Entity.init(JSONObject:)) else { return nil }
        self.annotatedEntity = annotatedEntity
        let optionalAnnotatedEntity = (JSONObject["optional_annotated_entity"]).flatMap(Entity.init(JSONObject:))
        self.optionalAnnotatedEntity = optionalAnnotatedEntity
    }
}

// MARK: - JSONDeserializableProperty.Entity AutoJSONDeserializable
extension JSONDeserializableProperty.Entity: JSONDeserializable {
    internal init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any] else { return nil }
        guard let name = (JSONObject["name"] as? String) else { return nil }
        self.name = name
    }
}

// MARK: - MultiTypesProperties AutoJSONDeserializable
extension MultiTypesProperties: JSONDeserializable {
    internal init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any] else { return nil }
        guard let string = (JSONObject["string"] as? String) else { return nil }
        self.string = string
        guard let integer = (JSONObject["integer"] as? Int) else { return nil }
        self.integer = integer
        let optionalInteger = (JSONObject["optionalInteger"] as? Int)
        self.optionalInteger = optionalInteger
        guard let double = (JSONObject["double"] as? Double) else { return nil }
        self.double = double
        let optionalDouble = (JSONObject["optionalDouble"] as? Double)
        self.optionalDouble = optionalDouble
    }
}

// MARK: - OptionalProperty AutoJSONDeserializable
extension OptionalProperty: JSONDeserializable {
    internal init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any] else { return nil }
        let name = (JSONObject["name"] as? String)
        self.name = name
    }
}

// MARK: - SinglePropertyNoAnnotation AutoJSONDeserializable
extension SinglePropertyNoAnnotation: JSONDeserializable {
    internal init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any] else { return nil }
        guard let name = (JSONObject["name"] as? String) else { return nil }
        self.name = name
    }
}

// MARK: - SinglePropertyWithKeyPathAnnotation AutoJSONDeserializable
extension SinglePropertyWithKeyPathAnnotation: JSONDeserializable {
    internal init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any] else { return nil }
        guard let name = (JSONObject["label"] as? String) else { return nil }
        self.name = name
    }
}

// MARK: - StringEnumProperty AutoJSONDeserializable
extension StringEnumProperty: JSONDeserializable {
    internal init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any] else { return nil }
        guard let enumValue = (JSONObject["enumValue"] as? String).flatMap({ StringEnum(rawValue: $0) }) else { return nil }
        self.enumValue = enumValue
        let optionalEnumValue = (JSONObject["optionalEnumValue"] as? String).flatMap({ StringEnum(rawValue: $0) })
        self.optionalEnumValue = optionalEnumValue
    }
}

// MARK: - TypealiasedDateArrayProperty AutoJSONDeserializable
extension TypealiasedDateArrayProperty: JSONDeserializable {
    internal init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any] else { return nil }
        guard let momentArray = (JSONObject["momentArray"] as? [Any])?.flatMap(Date.init(JSONObject:)) else { return nil }
        self.momentArray = momentArray
    }
}

// MARK: - TypealiasedDateProperty AutoJSONDeserializable
extension TypealiasedDateProperty: JSONDeserializable {
    internal init?(JSONObject: Any) {
        guard let JSONObject = JSONObject as? [String: Any] else { return nil }
        guard let momentInTime = (JSONObject["momentInTime"]).flatMap(MomentInTime.init(JSONObject:)) else { return nil }
        self.momentInTime = momentInTime
        let optionalMomentInTime = (JSONObject["optionalMomentInTime"]).flatMap(MomentInTime.init(JSONObject:))
        self.optionalMomentInTime = optionalMomentInTime
    }
}

// MARK: -
