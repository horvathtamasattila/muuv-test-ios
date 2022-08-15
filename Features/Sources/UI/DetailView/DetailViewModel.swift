import Combine
import Foundation
import ReqresClient

final class DetailViewModel: ObservableObject {
    @Published var user: User?

    private var subscription: Set<AnyCancellable> = []

    init(usersUseCase: UsersUseCase) {
        usersUseCase.getSelectedUserDetails()
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [unowned self] user in
                    self.user = user
                }
            )
            .store(in: &subscription)
    }
}
