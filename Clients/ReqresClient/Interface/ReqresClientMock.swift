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
            },
            getUserById: { _ in
                Result.Publisher(User.mock).eraseToAnyPublisher()
            },
            updateUser: { _, _, _ in
                Result.Publisher(UserUpdate.mock).eraseToAnyPublisher()
            }
        )
    }
}

public extension User {
    static var mock: User {
        User(
            id: 1,
            email: "johndoe@reqres.com",
            first_name: "John",
            last_name: "Doe",
            avatar: ""
        )
    }
}

public extension UserUpdate {
    static var mock: UserUpdate {
        UserUpdate(name: "Morpheus", job: "Zion resident")
    }
}
