import Combine
import Foundation
import ReqresClient

final class ListViewModel: ObservableObject {
    @Published var users: [User]
    @Published var isShowingLoadingView: Bool
    @Published var isShowingAlert: Bool

    private var pageNumber: Int
    private let usersUseCase: UsersUseCase
    private let coordinator: Coordinator
    private var subscription: Set<AnyCancellable> = []
    init(
        coordinator: Coordinator,
        usersUseCase: UsersUseCase
    ) {
        self.users = []
        self.pageNumber = 1
        self.isShowingLoadingView = true
        self.isShowingAlert = false
        self.usersUseCase = usersUseCase
        self.coordinator = coordinator

        loadUsers(page: pageNumber)
    }

    func nextDidTap() {
        if pageNumber < 3 {
            pageNumber += 1
            loadUsers(page: pageNumber)
        }
    }

    func backDidTap() {
        if pageNumber > 1 {
            pageNumber -= 1
            loadUsers(page: pageNumber)
        }
    }

    func userDidTap(id: Int) {
        usersUseCase.setSelectedUserId(id: id)
        coordinator.changeView(to: .detail)
    }

    private func loadUsers(page: Int) {
        self.isShowingLoadingView = true
        unowned let unownedSelf = self
        usersUseCase.getUserList(page: page)
            .sink(
                receiveCompletion: {
                    completion in
                    if case .failure = completion {
                        unownedSelf.isShowingLoadingView = false
                        unownedSelf.isShowingAlert = true
                    }
                },
                receiveValue: { users in
                    unownedSelf.users = users
                    unownedSelf.isShowingLoadingView = false
                }
            )
            .store(in: &subscription)
    }
}
