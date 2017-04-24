protocol AutoJSONDeserializable {}

protocol JSONDeserializable {
    init?(JSONObject: [String: Any])
}
