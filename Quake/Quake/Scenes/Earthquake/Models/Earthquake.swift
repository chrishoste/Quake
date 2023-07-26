import Foundation

/// A structure representing a list of earthquakes, decoded from JSON data.
struct Earthquakes: Decodable {
    /// An array of earthquake responses.
    let earthquakes: [Earthquake.Response]
}

/// A structure representing an earthquake with its details.
struct Earthquake: Hashable {
    /// The unique identifier of the earthquake.
    let id: String
    /// The date and time when the earthquake occurred.
    let date: Date?
    /// The depth of the earthquake's epicenter.
    let depth: Double
    /// The magnitude of the earthquake.
    let magnitude: Double
    /// The location of the earthquake's epicenter.
    let location: Location
}

extension Earthquake {
    /// A structure representing an earthquake's response from JSON data.
    struct Response: Decodable {
        /// The unique identifier of the earthquake.
        let eqid: String
        /// The date and time when the earthquake occurred as a formatted string.
        let datetime: String
        /// The depth of the earthquake's epicenter.
        let depth: Double
        /// The magnitude of the earthquake.
        let magnitude: Double
        /// The longitude coordinate of the earthquake's epicenter.
        let lng: Double
        /// The latitude coordinate of the earthquake's epicenter.
        let lat: Double
    }
}
