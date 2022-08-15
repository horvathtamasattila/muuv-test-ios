import SwiftUI

extension View {
    @ViewBuilder func visible(_ visible: Bool) -> some View {
        if visible {
            self
        } else {
            self.hidden()
        }
    }
}
