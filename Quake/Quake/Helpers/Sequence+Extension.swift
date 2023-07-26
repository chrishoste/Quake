import Foundation

/// An extension on Sequence, providing an asynchronous version of map function.
extension Sequence {
    /// Asynchronously applies the given transform closure to each element in the sequence, and returns an array of the transformed values.
    /// - Parameters:
    ///   - transform: The asynchronous transformation closure that maps an element to a new value.
    /// - Returns: An array of transformed values of type T.
    /// - Throws: An error if the transformation closure throws an error.
    func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            try await values.append(transform(element))
        }

        return values
    }
}
