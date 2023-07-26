import SwiftUI

/// A SwiftUI view representing an item with a value and an image.
struct ValueImageItemView: View {
    /// The text to be displayed as the value.
    let text: String
    /// The name of the system image used for the icon.
    let imageName: String
    /// A boolean value indicating whether the item should be highlighted.
    let isHighlighted: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Text(text)
                .font(.headline)
                .bold()
                .foregroundStyle(Color.primary)
            Image(systemName: imageName)
                .resizable()
                .fontWeight(.light)
                .scaledToFit()
                .frame(height: 12)
                .foregroundStyle(Color.primary)
        }
        .frame(width: 48, height: 48)
        .background(isHighlighted ? Color.red.opacity(0.2) : Color.secondary.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

/// A preview provider for displaying the ValueImageItemView in SwiftUI previews.
#Preview {
    HStack {
        ValueImageItemView(text: "20", imageName: "ruler", isHighlighted: false)
        ValueImageItemView(text: "20", imageName: "ruler", isHighlighted: true)
    }
}
