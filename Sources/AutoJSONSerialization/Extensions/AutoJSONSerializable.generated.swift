// Generated using Sourcery 0.7.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable cyclomatic_complexity file_length function_body_length line_length

import Foundation

enum JSONDateFormatter {
    static func date(from string: String) -> Date? {
        if #available(iOS 10.0, macOS 10.12, *) {
            // [HACK] workaround for unsupported milliseconds part in ISO8601DateFormatter.
            // "1985-04-12T23:20:50Z" is supported where "1985-04-12T23:20:50.678Z" is not.
            // So this removes the ".678" part.
            let dateString = string.replacingOccurrences(of: "\\.\\d+", with: "", options: .regularExpression)
            // [/HACK]
            return isoDateFormatter.date(from: dateString)
        } else {
            return dateFormatter.date(from: string)
        }
    }

    static func string(from date: Date) -> String {
        if #available(iOS 10.0, macOS 10.12, *) {
            return isoDateFormatter.string(from: date)
        } else {
            return dateFormatter.string(from: date)
        }
    }

    @available(iOS 10.0, macOS 10.12, *)
    private static let isoDateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = .withInternetDateTime
        return formatter
    }()

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return formatter
    }()
}

extension Date {
    func iso8601String() -> String {
        return JSONDateFormatter.string(from: self)
    }
}

// MARK: - AutoJSONSerializable for classes, protocols, structs

// MARK: - ArrayProperty AutoJSONSerializable
extension ArrayProperty: JSONSerializable {
    internal func toJSONObject() -> Any {
        var jsonObject = [String: Any]()
        let array = self.array.map { $0.toJSONObject() }
        jsonObject["array"] = array
        return jsonObject
    }
}

// MARK: - BasicTypesArrayProperty AutoJSONSerializable
extension BasicTypesArrayProperty: JSONSerializable {
    internal func toJSONObject() -> Any {
        var jsonObject = [String: Any]()
        let doubleArray = self.doubleArray.map { $0 }
        jsonObject["doubleArray"] = doubleArray
        let integerArray = self.integerArray.map { $0 }
        jsonObject["integerArray"] = integerArray
        let stringArray = self.stringArray.map { $0 }
        jsonObject["stringArray"] = stringArray
        return jsonObject
    }
}

// MARK: - DateArrayProperty AutoJSONSerializable
extension DateArrayProperty: JSONSerializable {
    internal func toJSONObject() -> Any {
        var jsonObject = [String: Any]()
        let dateArray = self.dateArray.map { $0.iso8601String() }
        jsonObject["dateArray"] = dateArray
        return jsonObject
    }
}

// MARK: - DateProperty AutoJSONSerializable
extension DateProperty: JSONSerializable {
    internal func toJSONObject() -> Any {
        var jsonObject = [String: Any]()
        let date = self.date.iso8601String()
        jsonObject["date"] = date
        let optionalDate = self.optionalDate?.iso8601String()
        jsonObject["optional_date"] = optionalDate
        return jsonObject
    }
}

// MARK: - EnumArrayProperty AutoJSONSerializable
extension EnumArrayProperty: JSONSerializable {
    internal func toJSONObject() -> Any {
        var jsonObject = [String: Any]()
        let enumsArray = self.enumsArray.map { $0.rawValue }
        jsonObject["enumsArray"] = enumsArray
        return jsonObject
    }
}

// MARK: - EnumWithCustomSerdeProperties AutoJSONSerializable
extension EnumWithCustomSerdeProperties: JSONSerializable {
    internal func toJSONObject() -> Any {
        var jsonObject = [String: Any]()
        let intEnumUsingStringSerde = self.intEnumUsingStringSerde.toJSONObject()
        jsonObject["intEnumUsingStringSerde"] = intEnumUsingStringSerde
        let customSerdeEnum = self.customSerdeEnum.toJSONObject()
        jsonObject["customSerdeEnum"] = customSerdeEnum
        let optionalCustomSerdeEnum = self.optionalCustomSerdeEnum?.toJSONObject()
        jsonObject["optionalCustomSerdeEnum"] = optionalCustomSerdeEnum
        return jsonObject
    }
}

// MARK: - IntEnumProperty AutoJSONSerializable
extension IntEnumProperty: JSONSerializable {
    internal func toJSONObject() -> Any {
        var jsonObject = [String: Any]()
        let enumValue = self.enumValue.rawValue
        jsonObject["enumValue"] = enumValue
        let optionalEnumValue = self.optionalEnumValue?.rawValue
        jsonObject["optionalEnumValue"] = optionalEnumValue
        return jsonObject
    }
}

// MARK: - JSONDeserializableProperty AutoJSONSerializable
extension JSONDeserializableProperty: JSONSerializable {
    internal func toJSONObject() -> Any {
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
    internal func toJSONObject() -> Any {
        var jsonObject = [String: Any]()
        let name = self.name
        jsonObject["name"] = name
        return jsonObject
    }
}

// MARK: - MultiTypesProperties AutoJSONSerializable
extension MultiTypesProperties: JSONSerializable {
    internal func toJSONObject() -> Any {
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
    internal func toJSONObject() -> Any {
        var jsonObject = [String: Any]()
        let name = self.name
        jsonObject["name"] = name
        return jsonObject
    }
}

// MARK: - SinglePropertyNoAnnotation AutoJSONSerializable
extension SinglePropertyNoAnnotation: JSONSerializable {
    internal func toJSONObject() -> Any {
        var jsonObject = [String: Any]()
        let name = self.name
        jsonObject["name"] = name
        return jsonObject
    }
}

// MARK: - SinglePropertyWithKeyPathAnnotation AutoJSONSerializable
extension SinglePropertyWithKeyPathAnnotation: JSONSerializable {
    internal func toJSONObject() -> Any {
        var jsonObject = [String: Any]()
        let name = self.name
        jsonObject["label"] = name
        return jsonObject
    }
}

// MARK: - StringEnumProperty AutoJSONSerializable
extension StringEnumProperty: JSONSerializable {
    internal func toJSONObject() -> Any {
        var jsonObject = [String: Any]()
        let enumValue = self.enumValue.rawValue
        jsonObject["enumValue"] = enumValue
        let optionalEnumValue = self.optionalEnumValue?.rawValue
        jsonObject["optionalEnumValue"] = optionalEnumValue
        return jsonObject
    }
}

// MARK: - TypealiasedDateArrayProperty AutoJSONSerializable
extension TypealiasedDateArrayProperty: JSONSerializable {
    internal func toJSONObject() -> Any {
        var jsonObject = [String: Any]()
        let momentArray = self.momentArray.map { $0.iso8601String() }
        jsonObject["momentArray"] = momentArray
        return jsonObject
    }
}

// MARK: - TypealiasedDateProperty AutoJSONSerializable
extension TypealiasedDateProperty: JSONSerializable {
    internal func toJSONObject() -> Any {
        var jsonObject = [String: Any]()
        let momentInTime = self.momentInTime.iso8601String()
        jsonObject["momentInTime"] = momentInTime
        let optionalMomentInTime = self.optionalMomentInTime?.iso8601String()
        jsonObject["optionalMomentInTime"] = optionalMomentInTime
        return jsonObject
    }
}

// MARK: -
