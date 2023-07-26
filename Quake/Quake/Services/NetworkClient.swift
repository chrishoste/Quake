import Foundation

/// A client for making network requests and handling JSON decoding.
struct NetworkClient {
    /// Fetches data from the specified URL and decodes it into the specified type.
    /// - Parameters:
    ///   - url: The URL to fetch data from.
    /// - Returns: An instance of the specified type `T`, decoded from the data received from the URL.
    /// - Throws: An error if the network request or JSON decoding fails.
    func fetch<T: Decodable>(from url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
