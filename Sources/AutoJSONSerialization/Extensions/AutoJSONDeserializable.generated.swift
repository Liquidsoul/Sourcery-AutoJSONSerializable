// Generated using Sourcery 0.7.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable cyclomatic_complexity file_length function_body_length line_length

import Foundation

// MARK: - AutoJSONDeserializable for classes, protocols, structs

// MARK: - ArrayProperty AutoJSONDeserializable
extension ArrayProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        let arrayRawValue = JSONDictionary["array"]
        if arrayRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("array")
        }
        do {
        guard let array = try (arrayRawValue as? [Any])?.flatMap(MultiTypesProperties.init(JSONObject:)) else {
            // type: [MultiTypesProperties]
            throw AutoJSONDeserializableError.typeMismatchError([MultiTypesProperties].self)
        }
        self.array = array
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("array")
        }
    }
}

// MARK: - BasicTypesArrayProperty AutoJSONDeserializable
extension BasicTypesArrayProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        let doubleArrayRawValue = JSONDictionary["doubleArray"]
        if doubleArrayRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("doubleArray")
        }
        do {
        guard let doubleArray = (doubleArrayRawValue as? [Double]) else {
            // type: [Double]
            throw AutoJSONDeserializableError.typeMismatchError([Double].self)
        }
        self.doubleArray = doubleArray
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("doubleArray")
        }
        let integerArrayRawValue = JSONDictionary["integerArray"]
        if integerArrayRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("integerArray")
        }
        do {
        guard let integerArray = (integerArrayRawValue as? [Int]) else {
            // type: [Int]
            throw AutoJSONDeserializableError.typeMismatchError([Int].self)
        }
        self.integerArray = integerArray
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("integerArray")
        }
        let stringArrayRawValue = JSONDictionary["stringArray"]
        if stringArrayRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("stringArray")
        }
        do {
        guard let stringArray = (stringArrayRawValue as? [String]) else {
            // type: [String]
            throw AutoJSONDeserializableError.typeMismatchError([String].self)
        }
        self.stringArray = stringArray
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("stringArray")
        }
    }
}

// MARK: - DateArrayProperty AutoJSONDeserializable
extension DateArrayProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        let dateArrayRawValue = JSONDictionary["dateArray"]
        if dateArrayRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("dateArray")
        }
        do {
        guard let dateArray = try (dateArrayRawValue as? [Any])?.flatMap(Date.init(JSONObject:)) else {
            // type: [Date]
            throw AutoJSONDeserializableError.typeMismatchError([Date].self)
        }
        self.dateArray = dateArray
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("dateArray")
        }
    }
}

// MARK: - DateProperty AutoJSONDeserializable
extension DateProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        let dateRawValue = JSONDictionary["date"]
        if dateRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("date")
        }
        do {
        guard let date = try (dateRawValue).flatMap(Date.init(JSONObject:)) else {
            // type: Date
            throw AutoJSONDeserializableError.typeMismatchError(Date.self)
        }
        self.date = date
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("date")
        }
        let optionalDateRawValue = JSONDictionary["optional_date"]
        do {
        let optionalDate = try (optionalDateRawValue).flatMap(Date.init(JSONObject:))
        self.optionalDate = optionalDate
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("optional_date")
        }
    }
}

// MARK: - EnumArrayProperty AutoJSONDeserializable
extension EnumArrayProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        let enumsArrayRawValue = JSONDictionary["enumsArray"]
        if enumsArrayRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("enumsArray")
        }
        do {
        guard let enumsArray = (enumsArrayRawValue as? [String])?.flatMap({ StringEnum(rawValue: $0) }) else {
            // type: [StringEnum]
            throw AutoJSONDeserializableError.typeMismatchError([StringEnum].self)
        }
        self.enumsArray = enumsArray
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("enumsArray")
        }
    }
}

// MARK: - EnumWithCustomSerdeProperties AutoJSONDeserializable
extension EnumWithCustomSerdeProperties: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        let intEnumUsingStringSerdeRawValue = JSONDictionary["intEnumUsingStringSerde"]
        if intEnumUsingStringSerdeRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("intEnumUsingStringSerde")
        }
        do {
        guard let intEnumUsingStringSerde = try (intEnumUsingStringSerdeRawValue).flatMap(IntEnumUsingStringSerde.init(JSONObject:)) else {
            // type: IntEnumUsingStringSerde
            throw AutoJSONDeserializableError.typeMismatchError(IntEnumUsingStringSerde.self)
        }
        self.intEnumUsingStringSerde = intEnumUsingStringSerde
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("intEnumUsingStringSerde")
        }
        let customSerdeEnumRawValue = JSONDictionary["customSerdeEnum"]
        if customSerdeEnumRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("customSerdeEnum")
        }
        do {
        guard let customSerdeEnum = try (customSerdeEnumRawValue).flatMap(CustomSerdeEnum.init(JSONObject:)) else {
            // type: CustomSerdeEnum
            throw AutoJSONDeserializableError.typeMismatchError(CustomSerdeEnum.self)
        }
        self.customSerdeEnum = customSerdeEnum
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("customSerdeEnum")
        }
        let optionalCustomSerdeEnumRawValue = JSONDictionary["optionalCustomSerdeEnum"]
        do {
        let optionalCustomSerdeEnum = try (optionalCustomSerdeEnumRawValue).flatMap(CustomSerdeEnum.init(JSONObject:))
        self.optionalCustomSerdeEnum = optionalCustomSerdeEnum
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("optionalCustomSerdeEnum")
        }
    }
}

// MARK: - IntEnumProperty AutoJSONDeserializable
extension IntEnumProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        let enumValueRawValue = JSONDictionary["enumValue"]
        if enumValueRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("enumValue")
        }
        do {
        guard let enumValue = (enumValueRawValue as? Int).flatMap({ IntEnum(rawValue: $0) }) else {
            // type: IntEnum
            throw AutoJSONDeserializableError.typeMismatchError(IntEnum.self)
        }
        self.enumValue = enumValue
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("enumValue")
        }
        let optionalEnumValueRawValue = JSONDictionary["optionalEnumValue"]
        let optionalEnumValue = (optionalEnumValueRawValue as? Int).flatMap({ IntEnum(rawValue: $0) })
        self.optionalEnumValue = optionalEnumValue
    }
}

// MARK: - JSONDeserializableProperty AutoJSONDeserializable
extension JSONDeserializableProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        let entityRawValue = JSONDictionary["entity"]
        if entityRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("entity")
        }
        do {
        guard let entity = try (entityRawValue).flatMap(Entity.init(JSONObject:)) else {
            // type: Entity
            throw AutoJSONDeserializableError.typeMismatchError(Entity.self)
        }
        self.entity = entity
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("entity")
        }
        let optionalEntityRawValue = JSONDictionary["optionalEntity"]
        do {
        let optionalEntity = try (optionalEntityRawValue).flatMap(Entity.init(JSONObject:))
        self.optionalEntity = optionalEntity
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("optionalEntity")
        }
        let nilEntityRawValue = JSONDictionary["nilEntity"]
        do {
        let nilEntity = try (nilEntityRawValue).flatMap(Entity.init(JSONObject:))
        self.nilEntity = nilEntity
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("nilEntity")
        }
        let annotatedEntityRawValue = JSONDictionary["annotated_entity"]
        if annotatedEntityRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("annotated_entity")
        }
        do {
        guard let annotatedEntity = try (annotatedEntityRawValue).flatMap(Entity.init(JSONObject:)) else {
            // type: Entity
            throw AutoJSONDeserializableError.typeMismatchError(Entity.self)
        }
        self.annotatedEntity = annotatedEntity
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("annotated_entity")
        }
        let optionalAnnotatedEntityRawValue = JSONDictionary["optional_annotated_entity"]
        do {
        let optionalAnnotatedEntity = try (optionalAnnotatedEntityRawValue).flatMap(Entity.init(JSONObject:))
        self.optionalAnnotatedEntity = optionalAnnotatedEntity
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("optional_annotated_entity")
        }
    }
}

// MARK: - JSONDeserializableProperty.Entity AutoJSONDeserializable
extension JSONDeserializableProperty.Entity: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        let nameRawValue = JSONDictionary["name"]
        if nameRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("name")
        }
        do {
        guard let name = (nameRawValue as? String) else {
            // type: String
            throw AutoJSONDeserializableError.typeMismatchError(String.self)
        }
        self.name = name
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("name")
        }
    }
}

// MARK: - MultiTypesProperties AutoJSONDeserializable
extension MultiTypesProperties: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        let stringRawValue = JSONDictionary["string"]
        if stringRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("string")
        }
        do {
        guard let string = (stringRawValue as? String) else {
            // type: String
            throw AutoJSONDeserializableError.typeMismatchError(String.self)
        }
        self.string = string
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("string")
        }
        let integerRawValue = JSONDictionary["integer"]
        if integerRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("integer")
        }
        do {
        guard let integer = (integerRawValue as? Int) else {
            // type: Int
            throw AutoJSONDeserializableError.typeMismatchError(Int.self)
        }
        self.integer = integer
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("integer")
        }
        let optionalIntegerRawValue = JSONDictionary["optionalInteger"]
        let optionalInteger = (optionalIntegerRawValue as? Int)
        self.optionalInteger = optionalInteger
        let doubleRawValue = JSONDictionary["double"]
        if doubleRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("double")
        }
        do {
        guard let double = (doubleRawValue as? Double) else {
            // type: Double
            throw AutoJSONDeserializableError.typeMismatchError(Double.self)
        }
        self.double = double
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("double")
        }
        let optionalDoubleRawValue = JSONDictionary["optionalDouble"]
        let optionalDouble = (optionalDoubleRawValue as? Double)
        self.optionalDouble = optionalDouble
    }
}

// MARK: - OptionalProperty AutoJSONDeserializable
extension OptionalProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        let nameRawValue = JSONDictionary["name"]
        let name = (nameRawValue as? String)
        self.name = name
    }
}

// MARK: - SinglePropertyNoAnnotation AutoJSONDeserializable
extension SinglePropertyNoAnnotation: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        let nameRawValue = JSONDictionary["name"]
        if nameRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("name")
        }
        do {
        guard let name = (nameRawValue as? String) else {
            // type: String
            throw AutoJSONDeserializableError.typeMismatchError(String.self)
        }
        self.name = name
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("name")
        }
    }
}

// MARK: - SinglePropertyWithKeyPathAnnotation AutoJSONDeserializable
extension SinglePropertyWithKeyPathAnnotation: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        let nameRawValue = JSONDictionary["label"]
        if nameRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("label")
        }
        do {
        guard let name = (nameRawValue as? String) else {
            // type: String
            throw AutoJSONDeserializableError.typeMismatchError(String.self)
        }
        self.name = name
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("label")
        }
    }
}

// MARK: - StringEnumProperty AutoJSONDeserializable
extension StringEnumProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        let enumValueRawValue = JSONDictionary["enumValue"]
        if enumValueRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("enumValue")
        }
        do {
        guard let enumValue = (enumValueRawValue as? String).flatMap({ StringEnum(rawValue: $0) }) else {
            // type: StringEnum
            throw AutoJSONDeserializableError.typeMismatchError(StringEnum.self)
        }
        self.enumValue = enumValue
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("enumValue")
        }
        let optionalEnumValueRawValue = JSONDictionary["optionalEnumValue"]
        let optionalEnumValue = (optionalEnumValueRawValue as? String).flatMap({ StringEnum(rawValue: $0) })
        self.optionalEnumValue = optionalEnumValue
    }
}

// MARK: - TypealiasedDateArrayProperty AutoJSONDeserializable
extension TypealiasedDateArrayProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        let momentArrayRawValue = JSONDictionary["momentArray"]
        if momentArrayRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("momentArray")
        }
        do {
        guard let momentArray = try (momentArrayRawValue as? [Any])?.flatMap(Date.init(JSONObject:)) else {
            // type: [Moment]
            throw AutoJSONDeserializableError.typeMismatchError([Moment].self)
        }
        self.momentArray = momentArray
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("momentArray")
        }
    }
}

// MARK: - TypealiasedDateProperty AutoJSONDeserializable
extension TypealiasedDateProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        let momentInTimeRawValue = JSONDictionary["momentInTime"]
        if momentInTimeRawValue == nil {
            throw AutoJSONDeserializableError.keyNotFoundError("momentInTime")
        }
        do {
        guard let momentInTime = try (momentInTimeRawValue).flatMap(MomentInTime.init(JSONObject:)) else {
            // type: MomentInTime
            throw AutoJSONDeserializableError.typeMismatchError(MomentInTime.self)
        }
        self.momentInTime = momentInTime
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("momentInTime")
        }
        let optionalMomentInTimeRawValue = JSONDictionary["optionalMomentInTime"]
        do {
        let optionalMomentInTime = try (optionalMomentInTimeRawValue).flatMap(MomentInTime.init(JSONObject:))
        self.optionalMomentInTime = optionalMomentInTime
        } catch let error as AutoJSONDeserializableError {
            throw error.nestedUnderKey("optionalMomentInTime")
        }
    }
}

// MARK: -
