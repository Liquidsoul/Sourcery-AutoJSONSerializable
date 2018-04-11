// Generated using Sourcery 0.11.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable cyclomatic_complexity file_length function_body_length line_length

import Foundation

// MARK: - AutoJSONSerializable for classes, protocols, structs

// MARK: - TypealiasedDateArrayProperty AutoJSONSerializable
extension TypealiasedDateArrayProperty: JSONSerializable {
    internal func toJSONObject() -> Any {
        var jsonObject = [String: Any]()
        let momentArray = self.momentArray.map { $0.toJSONObject() }
        jsonObject["momentArray"] = momentArray
        return jsonObject
    }
}

// MARK: -
