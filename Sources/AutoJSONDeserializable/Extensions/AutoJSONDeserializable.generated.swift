// Generated using Sourcery 0.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable file_length

// MARK: - AutoJSONDeserializable for classes, protocols, structs
// MARK: - SinglePropertyNoAnnotation AutoJSONDeserializable
extension SinglePropertyNoAnnotation: JSONDeserializable {
    internal init?(JSONObject: [String: Any]) {
        guard let name = JSONObject["name"] as? String else { return nil }
        self.name = name
    }
}

// MARK: -
