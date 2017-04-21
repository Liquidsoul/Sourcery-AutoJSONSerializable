// Generated using Sourcery 0.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable file_length

// MARK: - AutoJSONDeserializable for classes, protocols, structs

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