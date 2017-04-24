import Foundation

enum JSONDateFormatter {
    static func date(from string: String) -> Date? {
        if #available(iOS 10.0, macOS 10.12, *) {
            return isoDateFormatter.date(from: string)
        } else {
            return dateFormatter.date(from: string)
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
