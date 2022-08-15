import SwiftUI

public struct ContentView: View {
    public init() {}
    @StateObject var coordinator = inject(Coordinator.self)
    public var body: some View {
        NavigationView {
            NavigationLink(
                destination: ListView().hideNavBar(),
                isActive: coordinator.isShowingList,
                label: { EmptyView() }
            )
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
