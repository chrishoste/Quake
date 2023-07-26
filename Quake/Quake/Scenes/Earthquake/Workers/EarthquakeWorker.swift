import Foundation

/// An error type representing potential errors encountered in the EarthquakeWorker.
enum EarthquakeWorkerError: Error {
    /// An error case indicating failure to unwrap the earthquake URL.
    case failedToUnwrapURL
}

/// A protocol defining the EarthquakeWorker's responsibilities and its dependencies.
protocol EarthquakeWorker {
    /// Asynchronously fetches earthquake data and returns an array of Earthquake objects.
    /// - Returns: An array of Earthquake objects representing earthquake data.
    /// - Throws: An error if there's a problem with fetching or processing the earthquake data.
    func fetchEarthquakes() async throws -> [Earthquake]
}

/// The default implementation of the EarthquakeWorker protocol.
struct DefaultEarthquakeWorker: EarthquakeWorker {
    
    /// The network client used for making network requests and handling JSON decoding.
    private let networkClient: NetworkClient
    
    /// Initializes the DefaultEarthquakeWorker with the specified network client.
    /// - Parameter networkClient: The NetworkClient used for making network requests and handling JSON decoding.
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    /// Asynchronously fetches earthquake data and returns an array of Earthquake objects.
    /// - Returns: An array of Earthquake objects representing earthquake data.
    /// - Throws: An error if there's a problem with fetching or processing the earthquake data.
    func fetchEarthquakes() async throws -> [Earthquake] {
        guard let url = EarthquakeConstants.earthquakeURL else {
            throw EarthquakeWorkerError.failedToUnwrapURL
        }
        
        let earthquakes: Earthquakes = try await networkClient.fetch(from: url)
        
        return await earthquakes.earthquakes.asyncMap { await .init($0) }
    }
}

private extension Earthquake {
    /// Initializes an Earthquake instance using an Earthquake.Response instance.
    /// - Parameter response: The Earthquake.Response object containing earthquake data.
    /// - Returns: An Earthquake instance initialized with earthquake data from the response.
    init(_ response: Response) async {
        self.id = response.eqid
        self.date = response.datetime.toDate
        self.depth = response.depth
        self.magnitude = response.magnitude
        self.location = await LocationService.getLocation(latitude: response.lat, longitude: response.lng)
    }
}
