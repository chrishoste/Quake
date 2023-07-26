import SwiftUI

/// A SwiftUI view representing a list of earthquakes.
struct EarthquakeListView: View {
    /// An array of earthquakes to be displayed in the list.
    var earthquakes: [Earthquake]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())], spacing: 12) {
                    ForEach(earthquakes, id: \.id) { earthquake in
                        NavigationLink(value: earthquake) {
                            ListCell(earthquake: earthquake)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Earthquakes")
            .navigationDestination(for: Earthquake.self) { earthquake in
                EarthquakeDetailView(earthquake: earthquake)
            }
        }
    }
}

/// A preview provider for displaying the EarthquakeListView in SwiftUI previews.
#Preview {
    EarthquakeListView(earthquakes: [])
}
