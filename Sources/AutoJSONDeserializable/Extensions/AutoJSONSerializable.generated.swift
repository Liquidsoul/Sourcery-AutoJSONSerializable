// Generated using Sourcery 0.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable file_length
// swiftlint:disable line_length

import Foundation

// MARK: - AutoJSONSerializable for classes, protocols, structs

// MARK: - DateProperty AutoJSONSerializable
extension DateProperty: JSONSerializable {
    internal func toJSONObject() -> [String: Any] {
        var jsonObject = [String: Any]()
        let date = self.date.iso8601String()
        jsonObject["date"] = date
        let optionalDate = self.optionalDate?.iso8601String()
        jsonObject["optional_date"] = optionalDate
        return jsonObject
    }
}

// MARK: - JSONDeserializableProperty AutoJSONSerializable
extension JSONDeserializableProperty: JSONSerializable {
    internal func toJSONObject() -> [String: Any] {
        var jsonObject = [String: Any]()
        let entity = self.entity.toJSONObject()
        jsonObject["entity"] = entity
        let optionalEntity = self.optionalEntity?.toJSONObject()
        jsonObject["optionalEntity"] = optionalEntity
        let nilEntity = self.nilEntity?.toJSONObject()
        jsonObject["nilEntity"] = nilEntity
        let annotatedEntity = self.annotatedEntity.toJSONObject()
        jsonObject["annotated_entity"] = annotatedEntity
        let optionalAnnotatedEntity = self.optionalAnnotatedEntity?.toJSONObject()
        jsonObject["optional_annotated_entity"] = optionalAnnotatedEntity
        return jsonObject
    }
}

// MARK: - JSONDeserializableProperty.Entity AutoJSONSerializable
extension JSONDeserializableProperty.Entity: JSONSerializable {
    internal func toJSONObject() -> [String: Any] {
        var jsonObject = [String: Any]()
        let name = self.name
        jsonObject["name"] = name
        return jsonObject
    }
}

// MARK: - MultiTypesProperties AutoJSONSerializable
extension MultiTypesProperties: JSONSerializable {
    internal func toJSONObject() -> [String: Any] {
        var jsonObject = [String: Any]()
        let string = self.string
        jsonObject["string"] = string
        let integer = self.integer
        jsonObject["integer"] = integer
        let optionalInteger = self.optionalInteger
        jsonObject["optionalInteger"] = optionalInteger
        let double = self.double
        jsonObject["double"] = double
        let optionalDouble = self.optionalDouble
        jsonObject["optionalDouble"] = optionalDouble
        return jsonObject
    }
}

// MARK: - OptionalProperty AutoJSONSerializable
extension OptionalProperty: JSONSerializable {
    internal func toJSONObject() -> [String: Any] {
        var jsonObject = [String: Any]()
        let name = self.name
        jsonObject["name"] = name
        return jsonObject
    }
}

// MARK: - SinglePropertyNoAnnotation AutoJSONSerializable
extension SinglePropertyNoAnnotation: JSONSerializable {
    internal func toJSONObject() -> [String: Any] {
        var jsonObject = [String: Any]()
        let name = self.name
        jsonObject["name"] = name
        return jsonObject
    }
}

// MARK: - SinglePropertyWithKeyPathAnnotation AutoJSONSerializable
extension SinglePropertyWithKeyPathAnnotation: JSONSerializable {
    internal func toJSONObject() -> [String: Any] {
        var jsonObject = [String: Any]()
        let name = self.name
        jsonObject["label"] = name
        return jsonObject
    }
}

// MARK: -
