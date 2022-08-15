import SwiftUI

struct DetailView: View {
    @StateObject var viewModel = inject(DetailViewModel.self)
    var body: some View {
        Button(
            action: viewModel.backDidTap,
            label: { Text("back_cta".localized) }
        )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
