import Combine
import Foundation

public struct ReqresClient {
    public var getUserList: (Int) -> AnyPublisher<[User], ReqresError>

    public init(
        getUserList: @escaping (Int) -> AnyPublisher<[User], ReqresError>
    ) {
        self.getUserList = getUserList
    }
}
