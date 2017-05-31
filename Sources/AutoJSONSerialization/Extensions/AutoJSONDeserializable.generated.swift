// Generated using Sourcery 0.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable file_length
// swiftlint:disable line_length

import Foundation

protocol JSONDeserializable {
    init?(JSONObject: [String: Any])
}

// MARK: - AutoJSONDeserializable for classes, protocols, structs

// MARK: - DateProperty AutoJSONDeserializable
extension DateProperty: JSONDeserializable {
    internal init?(JSONObject: [String: Any]) {
        guard let date = (JSONObject["date"] as? String).flatMap(JSONDateFormatter.date(from:)) else { return nil }
        self.date = date
        let optionalDate = (JSONObject["optional_date"] as? String).flatMap(JSONDateFormatter.date(from:))
        self.optionalDate = optionalDate
    }
}

// MARK: - JSONDeserializableProperty AutoJSONDeserializable
extension JSONDeserializableProperty: JSONDeserializable {
    internal init?(JSONObject: [String: Any]) {
        guard let entity = (JSONObject["entity"] as? [String: Any]).flatMap(Entity.init(JSONObject:)) else { return nil }
        self.entity = entity
        let optionalEntity = (JSONObject["optionalEntity"] as? [String: Any]).flatMap(Entity.init(JSONObject:))
        self.optionalEntity = optionalEntity
        let nilEntity = (JSONObject["nilEntity"] as? [String: Any]).flatMap(Entity.init(JSONObject:))
        self.nilEntity = nilEntity
        guard let annotatedEntity = (JSONObject["annotated_entity"] as? [String: Any]).flatMap(Entity.init(JSONObject:)) else { return nil }
        self.annotatedEntity = annotatedEntity
        let optionalAnnotatedEntity = (JSONObject["optional_annotated_entity"] as? [String: Any]).flatMap(Entity.init(JSONObject:))
        self.optionalAnnotatedEntity = optionalAnnotatedEntity
    }
}

// MARK: - JSONDeserializableProperty.Entity AutoJSONDeserializable
extension JSONDeserializableProperty.Entity: JSONDeserializable {
    internal init?(JSONObject: [String: Any]) {
        guard let name = JSONObject["name"] as? String else { return nil }
        self.name = name
    }
}

// MARK: - MultiTypesProperties AutoJSONDeserializable
extension MultiTypesProperties: JSONDeserializable {
    internal init?(JSONObject: [String: Any]) {
        guard let string = JSONObject["string"] as? String else { return nil }
        self.string = string
        guard let integer = JSONObject["integer"] as? Int else { return nil }
        self.integer = integer
        let optionalInteger = JSONObject["optionalInteger"] as? Int
        self.optionalInteger = optionalInteger
        guard let double = JSONObject["double"] as? Double else { return nil }
        self.double = double
        let optionalDouble = JSONObject["optionalDouble"] as? Double
        self.optionalDouble = optionalDouble
    }
}

// MARK: - OptionalProperty AutoJSONDeserializable
extension OptionalProperty: JSONDeserializable {
    internal init?(JSONObject: [String: Any]) {
        let name = JSONObject["name"] as? String
        self.name = name
    }
}

// MARK: - SinglePropertyNoAnnotation AutoJSONDeserializable
extension SinglePropertyNoAnnotation: JSONDeserializable {
    internal init?(JSONObject: [String: Any]) {
        guard let name = JSONObject["name"] as? String else { return nil }
        self.name = name
    }
}

// MARK: - SinglePropertyWithKeyPathAnnotation AutoJSONDeserializable
extension SinglePropertyWithKeyPathAnnotation: JSONDeserializable {
    internal init?(JSONObject: [String: Any]) {
        guard let name = JSONObject["label"] as? String else { return nil }
        self.name = name
    }
}

// MARK: -
