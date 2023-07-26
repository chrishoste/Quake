import SwiftUI

/// A SwiftUI view representing the details of an earthquake.
struct DetailsView: View {
    /// The earthquake object containing earthquake details.
    let earthquake: Earthquake
    
    var body: some View {
        VStack(alignment: .leading) {
            if let date = earthquake.date {
                Text(date.toString)
                    .font(.caption2)
                    .foregroundStyle(Color.secondary)
            }
            
            Text(earthquake.headline)
                .font(.title3)
                .bold()
                .foregroundStyle(Color.primary)
            
            Text(earthquake.subline)
                .font(.caption2)
                .foregroundStyle(Color.secondary)
            
            HStack {
                ValueImageItemView(text: String(format: "%.1f", earthquake.magnitude), imageName: "ruler", isHighlighted: earthquake.magnitude >= 8)
                ValueImageItemView(text: String(format: "%.0f", earthquake.depth), imageName: "water.waves.and.arrow.down", isHighlighted: false)
            }
        }
    }
}

/// An extension on Earthquake to provide computed properties for headline and subline strings.
private extension Earthquake {
    /// A computed property providing the headline string for the earthquake.
    var headline: String {
        location.country ?? location.ocean ?? "Earthquake at"
    }
    
    /// A computed property providing the subline string for the earthquake.
    var subline: String {
        "Lat: \(location.latitude), Long: \(location.longitude)"
    }
}

/// An extension on Date to convert it to a string using the "dd.MM.yyyy" format.
private extension Date {
    /// Converts the date to a string using the "dd.MM.yyyy" format.
    var toString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: self)
    }
}

/// A preview provider for displaying the DetailsView in SwiftUI previews.
#Preview {
    DetailsView(earthquake: .init())
}

/// An extension on Earthquake providing a convenience initializer for previews.
private extension Earthquake {
    /// A convenience initializer used for SwiftUI previews.
    init() {
        self.id = ""
        self.date = .now
        self.depth = 20
        self.magnitude = 8.9
        self.location = .init(country: "Germany", city: "Berlin", ocean: nil, latitude: 1, longitude: 1)
    }
}
