import SwiftUI
import MapKit

/// A SwiftUI view representing a map view centered on a specific location.
struct MapView: View {
    /// The location to be displayed on the map.
    let location: Location
    
    /// The initial distance (in meters) for the region shown on the map.
    private let regionDistance: Double = 5000000
    
    var body: some View {
        Map(initialPosition: .region(.init(center: location.asCLLocationCoordinate2D,
                                           latitudinalMeters: regionDistance,
                                           longitudinalMeters: regionDistance))) {
            Annotation("", coordinate: location.asCLLocationCoordinate2D) {
                Circle()
                    .fill(Color.red)
                    .frame(width: 10, height: 10)
            }
            
        }
       .frame(width: 120, height: 110)
       .clipShape(RoundedRectangle(cornerRadius: 10))
       .allowsHitTesting(false)
    }
}

/// An extension on Location to provide the location as CLLocationCoordinate2D.
private extension Location {
    /// Converts the Location to CLLocationCoordinate2D.
    var asCLLocationCoordinate2D: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}

/// A preview provider for displaying the MapView in SwiftUI previews.
#Preview {
    MapView(location: .init(latitude: 52.397083, longitude: 13.209567))
}
