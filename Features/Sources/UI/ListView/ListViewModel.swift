import Combine
import Foundation
import ReqresClient

final class ListViewModel: ObservableObject {
    @Published var users: [User]

    private let usersUseCase: UsersUseCase
    private var subscription: Set<AnyCancellable> = []
    init(usersUseCase: UsersUseCase) {
        self.users = []
        self.usersUseCase = usersUseCase
        
        usersUseCase.getUserList(page: 1)
            .sink(
                receiveCompletion: {
                    error in
                    print(error)
                },
                receiveValue: { users in
                    self.users = users
                }
            )
            .store(in: &subscription)
    }
}
