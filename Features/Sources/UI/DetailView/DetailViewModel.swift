import Combine
import Foundation
import ReqresClient
import SwiftUI

final class DetailViewModel: ObservableObject {
    @Published var user: User?
    @Published var updatedName: String
    @Published var updatedJob: String
    @Published var isShowingUpdateView: Bool

    var isShowingLoadingView: Bool {
        user == nil
    }

    private let coordinator: Coordinator
    private let usersUseCase: UsersUseCase
    private var subscription: Set<AnyCancellable> = []

    init(
        coordinator: Coordinator,
        usersUseCase: UsersUseCase
    ) {
        self.updatedName = ""
        self.updatedJob = ""
        self.isShowingUpdateView = false
        self.coordinator = coordinator
        self.usersUseCase = usersUseCase

        usersUseCase.getSelectedUserDetails()
            .sink(
                receiveCompletion: { completion in
                    if case .failure = completion {
                        coordinator.changeView(to: .list)
                    }
                },
                receiveValue: { [unowned self] user in
                    self.user = user
                }
            )
            .store(in: &subscription)
    }

    func updateDidTap() {
        withAnimation(.easeOut(duration: 0.3)) {
            isShowingUpdateView = true
        }
    }

    func updateCancelDidTap() {
        hideUpdateView()
    }

    func updateUpdateDidTap() {
        guard let user = user else {
            return
        }
        unowned let unownedSelf = self
        usersUseCase.updateUser(
            id: user.id,
            name: updatedName,
            job: updatedJob
        )
        .sink(
            receiveCompletion: { _ in },
            receiveValue: { _ in
                unownedSelf.hideUpdateView()
            }
        )
        .store(in: &subscription)
    }

    func backDidTap() {
        coordinator.changeView(to: .list)
    }

    private func hideUpdateView() {
        withAnimation(.easeOut(duration: 0.3)) {
            isShowingUpdateView = false
        }
    }
}
