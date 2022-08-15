import Combine
import Foundation
import ReqresClient

final class UsersUseCase {
    private let reqresClient: ReqresClient
    private let userRepository: UserRepository

    init(
        reqresClient: ReqresClient,
        userRepository: UserRepository
    ) {
        self.reqresClient = reqresClient
        self.userRepository = userRepository
    }

    func getUserList(page: Int) -> AnyPublisher<[User], ReqresError> {
        reqresClient.getUserList(page)
    }

    func getSelectedUserDetails() -> AnyPublisher<User, ReqresError> {
        let id = userRepository.selectedUserId!
        return reqresClient.getUserById(id)
    }

    func setSelectedUserId(id: Int) {
        userRepository.selectedUserId = id
    }
}
