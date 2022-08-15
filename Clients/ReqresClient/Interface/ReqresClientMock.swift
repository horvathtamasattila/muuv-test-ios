import Combine
import Foundation

public extension ReqresClient {
    static var mock: Self {
        return Self(
            getUserList: { _ in
                let resource = "get_users_200"
                let decoder = JSONDecoder()
                do {
                    let url = Bundle.main.url(forResource: resource, withExtension: "json")
                    let data = try Data(contentsOf: url!)
                    let result = try decoder.decode(ReqresResult.self, from: data)
                    return Result.Publisher(result.data).eraseToAnyPublisher()
                } catch {
                    print(error)
                    return Result.Publisher([]).eraseToAnyPublisher()
                }
            }
        )
    }
}
