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
        guard let id = userRepository.selectedUserId else {
            return Fail(error: ReqresError(error: "No selected user")).eraseToAnyPublisher()
        }
        return reqresClient.getUserById(id)
    }

    func updateUser(id: Int, name: String, job: String) -> AnyPublisher<UserUpdate, ReqresError> {
        reqresClient.updateUser(id, name, job)
    }

    func setSelectedUserId(id: Int) {
        userRepository.selectedUserId = id
    }
}
