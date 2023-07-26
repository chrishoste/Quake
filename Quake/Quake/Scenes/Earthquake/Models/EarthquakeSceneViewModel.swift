import Foundation

/// The view model for the Earthquake Scene, responsible for managing the state and data related to earthquakes.
class EarthquakeSceneViewModel: ObservableObject {
    /// The current state of the Earthquake Scene, represented as a published property.
    @Published var state: State = .loading

    /// The earthquake worker responsible for fetching earthquake data.
    private let earthquakeWorker: EarthquakeWorker
    
    /// Initializes the EarthquakeSceneViewModel with the specified earthquake worker.
    /// - Parameter earthquakeWorker: The EarthquakeWorker used for fetching earthquake data.
    init(earthquakeWorker: EarthquakeWorker) {
        self.earthquakeWorker = earthquakeWorker
    }
    
    /// Asynchronously fetches earthquake data and updates the state accordingly.
    @MainActor
    func fetchEarthquakes() async {
        state = .loading
        do {
            state = .data(try await earthquakeWorker.fetchEarthquakes())
        } catch {
            state = .error
        }
    }
}

/// An extension of EarthquakeSceneViewModel defining its possible states.
extension EarthquakeSceneViewModel {
    /// Represents the different states of the Earthquake Scene view model.
    enum State {
        /// The loading state, indicating that earthquake data is being fetched.
        case loading
        /// The error state, indicating that an error occurred while fetching earthquake data.
        case error
        /// The data state, containing an array of Earthquake objects fetched successfully.
        case data([Earthquake])
    }
}
