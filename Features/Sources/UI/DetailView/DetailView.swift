import Kingfisher
import SwiftUI

struct DetailView: View {
    @StateObject var viewModel = inject(DetailViewModel.self)
    var body: some View {
        ZStack {
            viewModel.user.map { user in
                VStack(alignment: .leading) {
                    Image(systemName: "chevron.left")
                        .scaleEffect(1.2)
                        .onTapGesture {
                            viewModel.backDidTap()
                        }
                        .padding(.bottom, 16)
                    HStack {
                        KFImage(user.avatarURL)
                            .placeholder { ProgressView() }
                            .cornerRadius(8)
                        Spacer()
                    }
                    HStack {
                        Text("\("detail_first_name".localized):")
                        Text(user.first_name)
                        Spacer()
                    }
                    .font(.body)
                    HStack {
                        Text("\("detail_last_name".localized):")
                        Text(user.last_name)
                        Spacer()
                    }
                    .font(.body)
                    HStack {
                        Text("\("detail_email".localized):")
                        Text(user.email)
                        Spacer()
                    }
                    .font(.body)
                    Spacer()

                    MuuvButton(
                        action: viewModel.updateDidTap,
                        label: "update_button".localized,
                        color: Color.primaryGreen
                    )
                }
                .padding(.horizontal, 16)
            }
            .zIndex(0)
            .visible(!viewModel.isShowingLoadingView)
            LoadingView()
                .visible(viewModel.isShowingLoadingView)
                .zIndex(1)
            UserUpdateView(
                name: $viewModel.updatedName,
                job: $viewModel.updatedJob,
                cancelDidTap: viewModel.updateCancelDidTap,
                updateDidTap: viewModel.updateUpdateDidTap
            )
            .zIndex(2)
            .visible(viewModel.isShowingUpdateView)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
