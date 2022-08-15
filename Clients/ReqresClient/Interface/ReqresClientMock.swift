import Combine
import Foundation

public extension ReqresClient {
    static var mock: Self {
        return Self(
            getUserList: { _ in Result.Publisher([]).eraseToAnyPublisher() }
        )
    }
}
