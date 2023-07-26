import SwiftUI
import MapKit
import CoreLocation

/// A SwiftUI view representing the detail view of an earthquake.
struct EarthquakeDetailView: View {
    /// The earthquake object containing earthquake details to be displayed in the detail view.
    let earthquake: Earthquake
    
    private let regionDistance: Double = 50000
    private let regionRadius: Double = 3000
    
    /// The location of the earthquake as a `CLLocationCoordinate2D`.
    private var location: CLLocationCoordinate2D {
        .init(latitude: earthquake.location.latitude, longitude: earthquake.location.longitude)
    }
    
    var body: some View {
        Map(initialPosition: .region(.init(center: location, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance))) {
            Marker("", coordinate: location)
            MapCircle(center: location, radius: regionRadius)
                .foregroundStyle(.red.opacity(0.5))
                .mapOverlayLevel(level: .aboveRoads)
        }
       .overlay {
           EarthquakeDetailOverlayView {
                   DetailsView(earthquake: earthquake)
           }
       }
    }
}

/// A private view used as an overlay in the EarthquakeDetailView.
private struct EarthquakeDetailOverlayView<Content: View>: View {
    private let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack {
                content()
                    .padding()
                    .frame(height: 120)
                    .background(Color(uiColor: .systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                Spacer()
            }
        }
    }
}

/// A preview provider for displaying the EarthquakeDetailView in SwiftUI previews.
#Preview {
    EarthquakeDetailView(earthquake: .init())
}

/// An extension on Earthquake providing a convenience initializer for previews.
private extension Earthquake {
    /// A convenience initializer used for SwiftUI previews.
    init() {
        self.id = ""
        self.date = .now
        self.depth = 20
        self.magnitude = 8.9
        self.location = .init(country: "Germany", city: "Berlin", ocean: nil, latitude: 52.397083, longitude: 13.209567)
    }
}
