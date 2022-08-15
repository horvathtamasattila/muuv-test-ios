import Combine
import Foundation
import ReqresClient

final class DetailViewModel: ObservableObject {
    @Published var user: User?

    private let coordinator: Coordinator
    private var subscription: Set<AnyCancellable> = []

    init(
        coordinator: Coordinator,
        usersUseCase: UsersUseCase
    ) {
        self.coordinator = coordinator
        usersUseCase.getSelectedUserDetails()
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [unowned self] user in
                    self.user = user
                }
            )
            .store(in: &subscription)
    }

    func backDidTap() {
        coordinator.changeView(to: .list)
    }
}
