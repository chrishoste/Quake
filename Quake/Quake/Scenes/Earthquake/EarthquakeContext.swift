import UIKit
import SwiftUI

/// A protocol defining the earthquake context and its dependencies.
protocol EarthquakeContext {
    /// Creates and returns the earthquake list view controller.
    /// - Returns: A UIViewController representing the earthquake list view.
    func makeEarthquakeListView() -> UIViewController
}

/// The default implementation of the EarthquakeContext protocol.
class DefaultEarthquakeContext: EarthquakeContext {
    
    private let networkClient: NetworkClient
    
    /// Initializes the DefaultEarthquakeContext with the specified network client.
    /// - Parameter networkClient: The NetworkClient used for making network requests and handling JSON decoding.
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    /// Creates and returns the earthquake list view controller.
    /// - Returns: A UIViewController representing the earthquake list view.
    func makeEarthquakeListView() -> UIViewController {
        let viewModel = EarthquakeSceneViewModel(earthquakeWorker: makeEarthquakeWorker())
        let listView = EarthquakeScene(viewModel: viewModel)
        
        return UIHostingController(rootView: listView)
    }
    
    /// Creates and returns an instance of EarthquakeWorker using the configured network client.
    /// - Returns: An instance of EarthquakeWorker.
    private func makeEarthquakeWorker() -> EarthquakeWorker {
        DefaultEarthquakeWorker(networkClient: networkClient)
    }
}

/// A struct containing constants related to earthquakes.
enum EarthquakeConstants {
    /// The URL for fetching earthquake data from the Geonames API.
    static let earthquakeURL = URL(string: "http://api.geonames.org/earthquakesJSON?formatted=true&north=44.1&south=-9.9&east=-22.4&west=55.2&username=mkoppelman")
}
