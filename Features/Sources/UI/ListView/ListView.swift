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

            Button(
                action: {},
                label: {
                    Text("next_cta".localized)
                        .font(.title3)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 48)
                }
            )
            .background(Color.primaryGreen)
            .cornerRadius(8)
            .buttonStyle(DefaultButtonStyle())
            .padding(.horizontal, 16)
            .padding(.bottom, 32)
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
