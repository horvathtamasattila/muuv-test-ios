import SwiftUI

struct ListView: View {
    @StateObject var viewModel = inject(ListViewModel.self)
    @StateObject var coordinator = inject(Coordinator.self)
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.users) { user in
                        ListElement(name: "\(user.first_name) \(user.last_name)", avatar: user.avatarURL)
                            .onTapGesture {
                                viewModel.userDidTap(id: user.id)
                            }
                    }
                }
            }
            .padding(.top, 32)

            HStack {
                MuuvButton(
                    action: viewModel.backDidTap,
                    label: "back_cta",
                    color: .neutral
                )
                MuuvButton(
                    action: viewModel.nextDidTap,
                    label: "next_cta",
                    color: .primaryGreen
                )
            }
            .padding(.horizontal, 16)

            detailLink
        }
        .overlay(
            LoadingView()
                .visible(viewModel.isShowingLoadingView)
        )
        .alert("alert_title".localized, isPresented: $viewModel.isShowingAlert, actions: {})
    }

    var detailLink: some View {
        NavigationLink(
            destination: DetailView().hideNavBar(),
            isActive: coordinator.isShowingDetail,
            label: { EmptyView() }
        )
        .navigationViewStyle(.stack)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
