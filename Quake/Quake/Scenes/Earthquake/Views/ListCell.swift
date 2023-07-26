import SwiftUI

/// A SwiftUI view representing a cell in a list, displaying earthquake details.
struct ListCell: View {
    /// The earthquake object containing earthquake details to be displayed in the cell.
    let earthquake: Earthquake
    
    var body: some View {
        HStack {
            MapView(location: earthquake.location)
            DetailsView(earthquake: earthquake)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary.opacity(0.5))
        }
    }
}

/// A preview provider for displaying the ListCell in SwiftUI previews.
#Preview {
    ListCell(earthquake: .init())
        .padding()
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
