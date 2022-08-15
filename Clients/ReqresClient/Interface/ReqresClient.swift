import Combine
import Foundation

public struct ReqresClient {
    public var getUserList: (Int) -> AnyPublisher<[[String]], ReqresError>

    public init(
        getUserList: @escaping (Int) -> AnyPublisher<[[String]], ReqresError>
    ) {
        self.getUserList = getUserList
    }
}
