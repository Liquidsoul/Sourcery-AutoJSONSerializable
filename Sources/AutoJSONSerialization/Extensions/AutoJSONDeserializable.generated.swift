// Generated using Sourcery 0.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable file_length
// swiftlint:disable line_length

import Foundation

// MARK: - AutoJSONDeserializable for classes, protocols, structs

// MARK: - ArrayProperty AutoJSONDeserializable
extension ArrayProperty: JSONDeserializable {
    internal init?(JSONObject: [String: Any]) {
        guard let array = (JSONObject["array"] as? [[String: Any]])?.flatMap(MultiTypesProperties.init(JSONObject:)) else { return nil }
        self.array = array
    }
}

// MARK: - BasicTypesArrayProperty AutoJSONDeserializable
extension BasicTypesArrayProperty: JSONDeserializable {
    internal init?(JSONObject: [String: Any]) {
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
    internal init?(JSONObject: [String: Any]) {
        guard let dateArray = (JSONObject["dateArray"] as? [String])?.flatMap(JSONDateFormatter.date(from:)) else { return nil }
        self.dateArray = dateArray
    }
}

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
        guard let name = (JSONObject["name"] as? String) else { return nil }
        self.name = name
    }
}

// MARK: - MultiTypesProperties AutoJSONDeserializable
extension MultiTypesProperties: JSONDeserializable {
    internal init?(JSONObject: [String: Any]) {
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
    internal init?(JSONObject: [String: Any]) {
        let name = (JSONObject["name"] as? String)
        self.name = name
    }
}

// MARK: - SinglePropertyNoAnnotation AutoJSONDeserializable
extension SinglePropertyNoAnnotation: JSONDeserializable {
    internal init?(JSONObject: [String: Any]) {
        guard let name = (JSONObject["name"] as? String) else { return nil }
        self.name = name
    }
}

// MARK: - SinglePropertyWithKeyPathAnnotation AutoJSONDeserializable
extension SinglePropertyWithKeyPathAnnotation: JSONDeserializable {
    internal init?(JSONObject: [String: Any]) {
        guard let name = (JSONObject["label"] as? String) else { return nil }
        self.name = name
    }
}

// MARK: -
