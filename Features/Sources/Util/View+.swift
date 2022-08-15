import SwiftUI

extension View {
    @ViewBuilder func visible(_ visible: Bool) -> some View {
        if visible {
            self
        } else {
            self.hidden()
        }
    }

    func hideNavBar() -> some View {
        navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}
