import SwiftUI

/// A SwiftUI view representing a loading indicator with a text.
struct LoadingView: View {
    var body: some View {
        VStack(spacing: 8) {
            ProgressView()
            Text("Loading ...")
        }
    }
}

/// A preview provider for displaying the LoadingView in SwiftUI previews.
#Preview {
    LoadingView()
}
