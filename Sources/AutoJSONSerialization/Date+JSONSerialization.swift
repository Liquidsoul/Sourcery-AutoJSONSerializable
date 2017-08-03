import Foundation

extension Date: JSONSerializable {
    public func toJSONObject() -> Any {
        return JSONDateFormatter.string(from: self)
    }
}

extension Date: JSONDeserializable {
    public init?(JSONObject: Any) {
        guard let dateString = JSONObject as? String,
              let date = JSONDateFormatter.date(from: dateString) else {
            return nil
        }
        self = date
    }
}

enum JSONDateFormatter {
    static func date(from string: String) -> Date? {
        // [HACK] workaround for unsupported milliseconds part in ISO8601DateFormatter.
        // "1985-04-12T23:20:50Z" is supported where "1985-04-12T23:20:50.678Z" is not.
        // So this removes the ".678" part.
        let dateString = string.replacingOccurrences(of: "\\.\\d+", with: "", options: .regularExpression)
        // [/HACK]
        return isoDateFormatter.date(from: dateString)
    }

    static func string(from date: Date) -> String {
        return isoDateFormatter.string(from: date)
    }

    private static let isoDateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = .withInternetDateTime
        return formatter
    }()
}
