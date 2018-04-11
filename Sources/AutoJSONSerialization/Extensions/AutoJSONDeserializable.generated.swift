// Generated using Sourcery 0.11.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable cyclomatic_complexity file_length function_body_length line_length

import Foundation

// MARK: - AutoJSONDeserializable for classes, protocols, structs

// MARK: - TypealiasedDateArrayProperty AutoJSONDeserializable
extension TypealiasedDateArrayProperty: JSONDeserializable {
    internal init(JSONObject: Any) throws {
        guard let JSONDictionary = JSONObject as? [String: Any] else {
            throw AutoJSONDeserializableError.typeMismatchError([String: Any].self)
        }
        if let momentArrayRawValue = JSONDictionary["momentArray"], !(momentArrayRawValue is NSNull) {
            // variable: Variable: name = momentArray, typeName = [Moment], isComputed = false, isStatic = false, readAccess = internal, writeAccess = , isMutable = false, defaultValue = nil, annotations = [:], attributes = [:], isFinal = false, definedInTypeName = Optional(TypealiasedDateArrayProperty), actualDefinedInTypeName = Optional(TypealiasedDateArrayProperty)
            // variable.isArray: 1
            // variable.typeName: [Moment]
            // variable.typeName.array.elementType: Type: module = nil, typealiases = [:], isExtension = true, kind = extension, accessLevel = , name = Date, isGeneric = false, localName = Date, variables = [], methods = [Method: name = toJSONObject(), selectorName = toJSONObject, parameters = [], returnTypeName = Any, `throws` = false, `rethrows` = false, accessLevel = public, isStatic = false, isClass = false, isFailableInitializer = false, annotations = [:], definedInTypeName = Optional(Date), attributes = ["public": public], Method: name = init(JSONObject: Any), selectorName = init(JSONObject:), parameters = [MethodParameter: argumentLabel = Optional("JSONObject"), name = JSONObject, typeName = Any, `inout` = false, typeAttributes = [:], defaultValue = nil, annotations = [:]], returnTypeName = Date, `throws` = true, `rethrows` = false, accessLevel = public, isStatic = false, isClass = false, isFailableInitializer = false, annotations = [:], definedInTypeName = Optional(Date), attributes = ["public": public]], subscripts = [], initializers = [Method: name = init(JSONObject: Any), selectorName = init(JSONObject:), parameters = [MethodParameter: argumentLabel = Optional("JSONObject"), name = JSONObject, typeName = Any, `inout` = false, typeAttributes = [:], defaultValue = nil, annotations = [:]], returnTypeName = Date, `throws` = true, `rethrows` = false, accessLevel = public, isStatic = false, isClass = false, isFailableInitializer = false, annotations = [:], definedInTypeName = Optional(Date), attributes = ["public": public]], annotations = [:], staticVariables = [], staticMethods = [], classMethods = [], instanceVariables = [], instanceMethods = [Method: name = toJSONObject(), selectorName = toJSONObject, parameters = [], returnTypeName = Any, `throws` = false, `rethrows` = false, accessLevel = public, isStatic = false, isClass = false, isFailableInitializer = false, annotations = [:], definedInTypeName = Optional(Date), attributes = ["public": public], Method: name = init(JSONObject: Any), selectorName = init(JSONObject:), parameters = [MethodParameter: argumentLabel = Optional("JSONObject"), name = JSONObject, typeName = Any, `inout` = false, typeAttributes = [:], defaultValue = nil, annotations = [:]], returnTypeName = Date, `throws` = true, `rethrows` = false, accessLevel = public, isStatic = false, isClass = false, isFailableInitializer = false, annotations = [:], definedInTypeName = Optional(Date), attributes = ["public": public]], computedVariables = [], storedVariables = [], inheritedTypes = ["JSONSerializable", "JSONDeserializable"], containedTypes = [], parentName = nil, parentTypes = AnyIterator<Type>(_box: Swift._IteratorBox<Swift._ClosureBasedIterator<SourceryRuntime.Type>>), attributes = [:]
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

// MARK: -
