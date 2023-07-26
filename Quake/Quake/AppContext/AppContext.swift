import UIKit

/// A protocol defining the application context and its dependencies.
protocol AppContext {
    /// Retrieves the entry view controller for the application.
    /// - Returns: The entry view controller that should be displayed when the application starts.
    func entryViewController() -> UIViewController
}

/// The default implementation of the AppContext protocol.
final class DefaultAppContext: AppContext {
    /// The network client used for making network requests and handling JSON decoding.
    lazy var networkClient: NetworkClient = {
        NetworkClient()
    }()
    
    /// The earthquake context, which provides access to earthquake-related scenes and data.
    lazy var earthquakeContext: EarthquakeContext = {
        DefaultEarthquakeContext(networkClient: networkClient)
    }()
    
    /// Retrieves the entry view controller for the application.
    /// - Returns: The entry view controller for the application.
    func entryViewController() -> UIViewController {
        earthquakeContext.makeEarthquakeListView()
    }
}
