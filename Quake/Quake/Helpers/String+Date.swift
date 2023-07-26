import Foundation

/// An extension on String, providing a computed property to convert a formatted date string into a Date object.
extension String {
    /// Converts the formatted date string into a Date object.
    /// - Returns: A Date object if the conversion is successful, otherwise nil.
    var toDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        
        return dateFormatter.date(from: self)
    }
}
