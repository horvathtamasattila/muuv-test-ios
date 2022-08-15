import SwiftUI

struct MuuvButton: View {
    let action: () -> Void
    let label: String
    let color: Color
    var body: some View {
        Button(
            action: action,
            label: {
                Text(label.localized)
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 48)
            }
        )
        .background(color)
        .cornerRadius(8)
        .buttonStyle(DefaultButtonStyle())
        .padding(.bottom, 32)
    }
}
