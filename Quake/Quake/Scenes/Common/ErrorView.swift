import SwiftUI

/// A SwiftUI view representing an error state with an option to retry an action.
struct ErrorView: View {
    /// The action closure to be executed when the "Retry" button is tapped.
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .frame(width: 200, height: 200)
            
            Text("Oops! Failed to load earthquake data. \n Please try again.")
                .font(.headline)
                .foregroundStyle(.primary)
                .multilineTextAlignment(.center)
            
            Button("Retry", action: action)
                .buttonStyle(.bordered)
        }
    }
}

/// A preview provider for displaying the ErrorView in SwiftUI previews.
#Preview {
    ErrorView{}
}
