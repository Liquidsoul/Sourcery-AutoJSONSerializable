import Foundation

extension Date: JSONSerializable {
    func toJSONObject() -> Any {
        return JSONDateFormatter.string(from: self)
    }
}

extension Date: JSONDeserializable {
    init?(JSONObject: Any) {
        guard let dateString = JSONObject as? String,
              let date = JSONDateFormatter.date(from: dateString) else {
            return nil
        }
        self = date
    }
}

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
