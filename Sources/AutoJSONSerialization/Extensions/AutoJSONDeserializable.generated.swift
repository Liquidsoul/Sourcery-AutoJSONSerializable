// Generated using Sourcery 0.11.1 — https://github.com/krzysztofzablocki/Sourcery
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
        if let arrayRawValue = JSONDictionary["array"], !(arrayRawValue is NSNull) {
            do {
                guard let castedArray = arrayRawValue as? [Any] else {
                    throw AutoJSONDeserializableError.typeMismatchError([MultiTypesProperties].self)
                }
                self.array = try castedArray.enumerated().map { indexElementTuple -> MultiTypesProperties in
                    let index = indexElementTuple.0
                    let element = indexElementTuple.1
                    do {
                        return try MultiTypesProperties(JSONObject: element)
                    } catch let error as AutoJSONDeserializableError {
                        throw error.nestedUnderKey(.index(index))
                    }
                }
            } catch let error as AutoJSONDeserializableError {
                throw error.nestedUnderKey(.name("array"))
            }
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("array")
        }
    }
}

// MARK: - BasicTypesArrayProperty AutoJSONDeserializable
extension BasicTypesArrayProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        if let doubleArrayRawValue = JSONDictionary["doubleArray"], !(doubleArrayRawValue is NSNull) {
            guard let doubleArray = doubleArrayRawValue as? [Double] else {
                throw AutoJSONDeserializableError.typeMismatchError([Double].self, keyPath: .init(key: .name("doubleArray")))
            }
            self.doubleArray = doubleArray
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("doubleArray")
        }
        if let integerArrayRawValue = JSONDictionary["integerArray"], !(integerArrayRawValue is NSNull) {
            guard let integerArray = integerArrayRawValue as? [Int] else {
                throw AutoJSONDeserializableError.typeMismatchError([Int].self, keyPath: .init(key: .name("integerArray")))
            }
            self.integerArray = integerArray
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("integerArray")
        }
        if let stringArrayRawValue = JSONDictionary["stringArray"], !(stringArrayRawValue is NSNull) {
            guard let stringArray = stringArrayRawValue as? [String] else {
                throw AutoJSONDeserializableError.typeMismatchError([String].self, keyPath: .init(key: .name("stringArray")))
            }
            self.stringArray = stringArray
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("stringArray")
        }
    }
}

// MARK: - DateArrayProperty AutoJSONDeserializable
extension DateArrayProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        if let dateArrayRawValue = JSONDictionary["dateArray"], !(dateArrayRawValue is NSNull) {
            do {
                guard let castedArray = dateArrayRawValue as? [Any] else {
                    throw AutoJSONDeserializableError.typeMismatchError([Date].self)
                }
                self.dateArray = try castedArray.enumerated().map { indexElementTuple -> Date in
                    let index = indexElementTuple.0
                    let element = indexElementTuple.1
                    do {
                        return try Date(JSONObject: element)
                    } catch let error as AutoJSONDeserializableError {
                        throw error.nestedUnderKey(.index(index))
                    }
                }
            } catch let error as AutoJSONDeserializableError {
                throw error.nestedUnderKey(.name("dateArray"))
            }
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("dateArray")
        }
    }
}

// MARK: - DateProperty AutoJSONDeserializable
extension DateProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        if let dateRawValue = JSONDictionary["date"], !(dateRawValue is NSNull) {
            do {
                let date = try Date(JSONObject: dateRawValue)
                self.date = date
            } catch let error as AutoJSONDeserializableError {
                throw error.nestedUnderKey(.name("date"))
            }
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("date")
        }
        if let optionalDateRawValue = JSONDictionary["optional_date"], !(optionalDateRawValue is NSNull) {
            do {
                let optionalDate = try Date(JSONObject: optionalDateRawValue)
                self.optionalDate = optionalDate
            } catch let error as AutoJSONDeserializableError {
                throw error.nestedUnderKey(.name("optional_date"))
            }
        } else {
            self.optionalDate = nil
        }
    }
}

// MARK: - EnumArrayProperty AutoJSONDeserializable
extension EnumArrayProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        if let enumsArrayRawValue = JSONDictionary["enumsArray"], !(enumsArrayRawValue is NSNull) {
            do {
                // StringEnum
                guard let castedArray = enumsArrayRawValue as? [String] else {
                    throw AutoJSONDeserializableError.typeMismatchError([String].self)
                }
                self.enumsArray = try castedArray.enumerated().map { indexElementTuple -> StringEnum in
                    let index = indexElementTuple.0
                    let element = indexElementTuple.1
                    guard let enumValue = StringEnum(rawValue: element) else {
                        throw AutoJSONDeserializableError.typeMismatchError(StringEnum.self, keyPath: .init(key: .index(index)))
                    }
                    return enumValue
                }
            } catch let error as AutoJSONDeserializableError {
                throw error.nestedUnderKey(.name("enumsArray"))
            }
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("enumsArray")
        }
    }
}

// MARK: - EnumWithCustomSerdeProperties AutoJSONDeserializable
extension EnumWithCustomSerdeProperties: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        if let intEnumUsingStringSerdeRawValue = JSONDictionary["intEnumUsingStringSerde"], !(intEnumUsingStringSerdeRawValue is NSNull) {
            do {
                let intEnumUsingStringSerde = try IntEnumUsingStringSerde(JSONObject: intEnumUsingStringSerdeRawValue)
                self.intEnumUsingStringSerde = intEnumUsingStringSerde
            } catch let error as AutoJSONDeserializableError {
                throw error.nestedUnderKey(.name("intEnumUsingStringSerde"))
            }
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("intEnumUsingStringSerde")
        }
        if let customSerdeEnumRawValue = JSONDictionary["customSerdeEnum"], !(customSerdeEnumRawValue is NSNull) {
            do {
                let customSerdeEnum = try CustomSerdeEnum(JSONObject: customSerdeEnumRawValue)
                self.customSerdeEnum = customSerdeEnum
            } catch let error as AutoJSONDeserializableError {
                throw error.nestedUnderKey(.name("customSerdeEnum"))
            }
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("customSerdeEnum")
        }
        if let optionalCustomSerdeEnumRawValue = JSONDictionary["optionalCustomSerdeEnum"], !(optionalCustomSerdeEnumRawValue is NSNull) {
            do {
                let optionalCustomSerdeEnum = try CustomSerdeEnum(JSONObject: optionalCustomSerdeEnumRawValue)
                self.optionalCustomSerdeEnum = optionalCustomSerdeEnum
            } catch let error as AutoJSONDeserializableError {
                throw error.nestedUnderKey(.name("optionalCustomSerdeEnum"))
            }
        } else {
            self.optionalCustomSerdeEnum = nil
        }
    }
}

// MARK: - IntEnumProperty AutoJSONDeserializable
extension IntEnumProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        if let enumValueRawValue = JSONDictionary["enumValue"], !(enumValueRawValue is NSNull) {
            guard let castedVar = enumValueRawValue as? Int,
                  let enumValue = IntEnum(rawValue: castedVar) else {
                throw AutoJSONDeserializableError.typeMismatchError(IntEnum.self, keyPath: .init(key: .name("enumValue")))
            }
            self.enumValue = enumValue
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("enumValue")
        }
        if let optionalEnumValueRawValue = JSONDictionary["optionalEnumValue"], !(optionalEnumValueRawValue is NSNull) {
            guard let castedVar = optionalEnumValueRawValue as? Int,
                  let optionalEnumValue = IntEnum(rawValue: castedVar) else {
                throw AutoJSONDeserializableError.typeMismatchError(IntEnum.self, keyPath: .init(key: .name("optionalEnumValue")))
            }
            self.optionalEnumValue = optionalEnumValue
        } else {
            self.optionalEnumValue = nil
        }
    }
}

// MARK: - JSONDeserializableProperty AutoJSONDeserializable
extension JSONDeserializableProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        if let entityRawValue = JSONDictionary["entity"], !(entityRawValue is NSNull) {
            do {
                let entity = try Entity(JSONObject: entityRawValue)
                self.entity = entity
            } catch let error as AutoJSONDeserializableError {
                throw error.nestedUnderKey(.name("entity"))
            }
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("entity")
        }
        if let optionalEntityRawValue = JSONDictionary["optionalEntity"], !(optionalEntityRawValue is NSNull) {
            do {
                let optionalEntity = try Entity(JSONObject: optionalEntityRawValue)
                self.optionalEntity = optionalEntity
            } catch let error as AutoJSONDeserializableError {
                throw error.nestedUnderKey(.name("optionalEntity"))
            }
        } else {
            self.optionalEntity = nil
        }
        if let nilEntityRawValue = JSONDictionary["nilEntity"], !(nilEntityRawValue is NSNull) {
            do {
                let nilEntity = try Entity(JSONObject: nilEntityRawValue)
                self.nilEntity = nilEntity
            } catch let error as AutoJSONDeserializableError {
                throw error.nestedUnderKey(.name("nilEntity"))
            }
        } else {
            self.nilEntity = nil
        }
        if let annotatedEntityRawValue = JSONDictionary["annotated_entity"], !(annotatedEntityRawValue is NSNull) {
            do {
                let annotatedEntity = try Entity(JSONObject: annotatedEntityRawValue)
                self.annotatedEntity = annotatedEntity
            } catch let error as AutoJSONDeserializableError {
                throw error.nestedUnderKey(.name("annotated_entity"))
            }
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("annotated_entity")
        }
        if let optionalAnnotatedEntityRawValue = JSONDictionary["optional_annotated_entity"], !(optionalAnnotatedEntityRawValue is NSNull) {
            do {
                let optionalAnnotatedEntity = try Entity(JSONObject: optionalAnnotatedEntityRawValue)
                self.optionalAnnotatedEntity = optionalAnnotatedEntity
            } catch let error as AutoJSONDeserializableError {
                throw error.nestedUnderKey(.name("optional_annotated_entity"))
            }
        } else {
            self.optionalAnnotatedEntity = nil
        }
    }
}

// MARK: - JSONDeserializableProperty.Entity AutoJSONDeserializable
extension JSONDeserializableProperty.Entity: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        if let nameRawValue = JSONDictionary["name"], !(nameRawValue is NSNull) {
            guard let name = nameRawValue as? String else {
                throw AutoJSONDeserializableError.typeMismatchError(String.self, keyPath: .init(key: .name("name")))
            }
            self.name = name
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("name")
        }
    }
}

// MARK: - MultiTypesProperties AutoJSONDeserializable
extension MultiTypesProperties: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        if let stringRawValue = JSONDictionary["string"], !(stringRawValue is NSNull) {
            guard let string = stringRawValue as? String else {
                throw AutoJSONDeserializableError.typeMismatchError(String.self, keyPath: .init(key: .name("string")))
            }
            self.string = string
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("string")
        }
        if let integerRawValue = JSONDictionary["integer"], !(integerRawValue is NSNull) {
            guard let integer = integerRawValue as? Int else {
                throw AutoJSONDeserializableError.typeMismatchError(Int.self, keyPath: .init(key: .name("integer")))
            }
            self.integer = integer
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("integer")
        }
        if let optionalIntegerRawValue = JSONDictionary["optionalInteger"], !(optionalIntegerRawValue is NSNull) {
            guard let optionalInteger = optionalIntegerRawValue as? Int else {
                throw AutoJSONDeserializableError.typeMismatchError(Int.self, keyPath: .init(key: .name("optionalInteger")))
            }
            self.optionalInteger = optionalInteger
        } else {
            self.optionalInteger = nil
        }
        if let doubleRawValue = JSONDictionary["double"], !(doubleRawValue is NSNull) {
            guard let double = doubleRawValue as? Double else {
                throw AutoJSONDeserializableError.typeMismatchError(Double.self, keyPath: .init(key: .name("double")))
            }
            self.double = double
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("double")
        }
        if let optionalDoubleRawValue = JSONDictionary["optionalDouble"], !(optionalDoubleRawValue is NSNull) {
            guard let optionalDouble = optionalDoubleRawValue as? Double else {
                throw AutoJSONDeserializableError.typeMismatchError(Double.self, keyPath: .init(key: .name("optionalDouble")))
            }
            self.optionalDouble = optionalDouble
        } else {
            self.optionalDouble = nil
        }
    }
}

// MARK: - OptionalProperty AutoJSONDeserializable
extension OptionalProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        if let nameRawValue = JSONDictionary["name"], !(nameRawValue is NSNull) {
            guard let name = nameRawValue as? String else {
                throw AutoJSONDeserializableError.typeMismatchError(String.self, keyPath: .init(key: .name("name")))
            }
            self.name = name
        } else {
            self.name = nil
        }
    }
}

// MARK: - SinglePropertyNoAnnotation AutoJSONDeserializable
extension SinglePropertyNoAnnotation: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        if let nameRawValue = JSONDictionary["name"], !(nameRawValue is NSNull) {
            guard let name = nameRawValue as? String else {
                throw AutoJSONDeserializableError.typeMismatchError(String.self, keyPath: .init(key: .name("name")))
            }
            self.name = name
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("name")
        }
    }
}

// MARK: - SinglePropertyWithKeyPathAnnotation AutoJSONDeserializable
extension SinglePropertyWithKeyPathAnnotation: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        if let nameRawValue = JSONDictionary["label"], !(nameRawValue is NSNull) {
            guard let name = nameRawValue as? String else {
                throw AutoJSONDeserializableError.typeMismatchError(String.self, keyPath: .init(key: .name("label")))
            }
            self.name = name
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("label")
        }
    }
}

// MARK: - StringEnumProperty AutoJSONDeserializable
extension StringEnumProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        if let enumValueRawValue = JSONDictionary["enumValue"], !(enumValueRawValue is NSNull) {
            guard let castedVar = enumValueRawValue as? String,
                  let enumValue = StringEnum(rawValue: castedVar) else {
                throw AutoJSONDeserializableError.typeMismatchError(StringEnum.self, keyPath: .init(key: .name("enumValue")))
            }
            self.enumValue = enumValue
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("enumValue")
        }
        if let optionalEnumValueRawValue = JSONDictionary["optionalEnumValue"], !(optionalEnumValueRawValue is NSNull) {
            guard let castedVar = optionalEnumValueRawValue as? String,
                  let optionalEnumValue = StringEnum(rawValue: castedVar) else {
                throw AutoJSONDeserializableError.typeMismatchError(StringEnum.self, keyPath: .init(key: .name("optionalEnumValue")))
            }
            self.optionalEnumValue = optionalEnumValue
        } else {
            self.optionalEnumValue = nil
        }
    }
}

// MARK: - TypealiasedDateArrayProperty AutoJSONDeserializable
extension TypealiasedDateArrayProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        if let momentArrayRawValue = JSONDictionary["momentArray"], !(momentArrayRawValue is NSNull) {
            do {
                guard let castedArray = momentArrayRawValue as? [Any] else {
                    throw AutoJSONDeserializableError.typeMismatchError([Date].self)
                }
                self.momentArray = try castedArray.enumerated().map { indexElementTuple -> Date in
                    let index = indexElementTuple.0
                    let element = indexElementTuple.1
                    do {
                        return try Date(JSONObject: element)
                    } catch let error as AutoJSONDeserializableError {
                        throw error.nestedUnderKey(.index(index))
                    }
                }
            } catch let error as AutoJSONDeserializableError {
                throw error.nestedUnderKey(.name("momentArray"))
            }
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("momentArray")
        }
    }
}

// MARK: - TypealiasedDateProperty AutoJSONDeserializable
extension TypealiasedDateProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        if let momentInTimeRawValue = JSONDictionary["momentInTime"], !(momentInTimeRawValue is NSNull) {
            do {
                let momentInTime = try MomentInTime(JSONObject: momentInTimeRawValue)
                self.momentInTime = momentInTime
            } catch let error as AutoJSONDeserializableError {
                throw error.nestedUnderKey(.name("momentInTime"))
            }
        } else {
            throw AutoJSONDeserializableError.keyNotFoundError("momentInTime")
        }
        if let optionalMomentInTimeRawValue = JSONDictionary["optionalMomentInTime"], !(optionalMomentInTimeRawValue is NSNull) {
            do {
                let optionalMomentInTime = try MomentInTime(JSONObject: optionalMomentInTimeRawValue)
                self.optionalMomentInTime = optionalMomentInTime
            } catch let error as AutoJSONDeserializableError {
                throw error.nestedUnderKey(.name("optionalMomentInTime"))
            }
        } else {
            self.optionalMomentInTime = nil
        }
    }
}

// MARK: -
