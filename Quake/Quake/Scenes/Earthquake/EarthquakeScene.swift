import SwiftUI

/// A SwiftUI view representing the main scene displaying earthquake information.
struct EarthquakeScene: View {
    /// The view model containing the state and logic for the earthquake scene.
    @ObservedObject var viewModel: EarthquakeSceneViewModel
    
    var body: some View {
        content()
        .task {
            await viewModel.fetchEarthquakes()
        }
    }
}

/// A private extension on EarthquakeScene providing the main content view of the scene.
private extension EarthquakeScene {
    /// The main content view of the earthquake scene, determined by the state of the view model.
    @ViewBuilder
    func content() -> some View {
        VStack(spacing: 0, content: {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .error:
                ErrorView {
                    Task {
                        await viewModel.fetchEarthquakes()
                    }
                }
            case .data(let earthquakes):
                EarthquakeListView(earthquakes: earthquakes)
            }
        })
    }
}

/// A preview provider for displaying the EarthquakeScene in SwiftUI previews.
#Preview {
    EarthquakeScene(viewModel: .init(earthquakeWorker: DefaultEarthquakeWorker(networkClient: .init())))
}
