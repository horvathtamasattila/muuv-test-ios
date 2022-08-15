import Combine
import Foundation
import ReqresClient

final class UsersUseCase {
    private let reqresClient: ReqresClient
    
    init(reqresClient: ReqresClient) {
        self.reqresClient = reqresClient
    }

    func getUserList(page: Int) -> AnyPublisher<[User], ReqresError> {
        reqresClient.getUserList(page)
    }
}
