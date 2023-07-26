import Foundation
import CoreLocation

/// Represents a location with various properties such as country, city, ocean, latitude, and longitude.
struct Location: Hashable {
    let country: String?
    let city: String?
    let ocean: String?
    let latitude: Double
    let longitude: Double
    
    /// Initializes a Location object with optional country, city, ocean, latitude, and longitude.
    /// - Parameters:
    ///   - country: The country name (optional).
    ///   - city: The city name (optional).
    ///   - ocean: The ocean name (optional).
    ///   - latitude: The latitude coordinate.
    ///   - longitude: The longitude coordinate.
    init(country: String? = nil, city: String? = nil, ocean: String? = nil, latitude: Double, longitude: Double) {
        self.country = country
        self.city = city
        self.ocean = ocean
        self.latitude = latitude
        self.longitude = longitude
    }
}

/// A protocol that defines the interface for a location geocoder.
protocol LocationGeocoder {
    /// Asynchronously reverse geocodes the given CLLocation and returns an array of CLPlacemark objects.
    /// - Parameters:
    ///   - location: The CLLocation object to be reverse geocoded.
    /// - Returns: An array of CLPlacemark objects representing the geographical information of the location.
    func reverseGeocodeLocation(_ location: CLLocation) async throws -> [CLPlacemark]
}

/// An extension that adopts the LocationGeocoder protocol for CLGeocoder.
extension CLGeocoder: LocationGeocoder {}

/// A service responsible for obtaining Location objects based on latitude and longitude coordinates.
struct LocationService {
    /// Asynchronously retrieves a Location object using the provided latitude and longitude.
    /// - Parameters:
    ///   - latitude: The latitude coordinate.
    ///   - longitude: The longitude coordinate.
    ///   - geocoder: An optional LocationGeocoder. Default is CLGeocoder.
    /// - Returns: A Location object representing the geographical information. If reverse geocoding fails, it returns a Location object with only latitude and longitude.
    static func getLocation(latitude: Double, longitude: Double, geocoder: LocationGeocoder = CLGeocoder()) async -> Location {
        let placemarks = try? await geocoder.reverseGeocodeLocation(.init(latitude: latitude, longitude: longitude))
        
        guard let placemark = placemarks?.first else {
            return .init(latitude: latitude, longitude: longitude)
        }
        
        return .init(country: placemark.country,
                     city: placemark.locality,
                     ocean: placemark.ocean,
                     latitude: latitude,
                     longitude: longitude)
    }
}
