import SwiftUI

struct ListView: View {
    @StateObject var viewModel = inject(ListViewModel.self)
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
                    }
                }
            }
            .padding(.top, 32)

            HStack {
                ListButton(
                    action: viewModel.backDidTap,
                    label: "back_cta",
                    color: .neutral
                )
                ListButton(
                    action: viewModel.nextDidTap,
                    label: "next_cta",
                    color: .primaryGreen
                )
            }
            .padding(.horizontal, 16)
        }
        .overlay(
            LoadingView()
                .visible(viewModel.isShowingLoadingView)
        )
        .alert("alert_title".localized, isPresented: $viewModel.isShowingAlert, actions: {})
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
