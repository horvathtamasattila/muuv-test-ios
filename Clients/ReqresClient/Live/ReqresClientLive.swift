import Alamofire
import HttpClientLive
import ReqresClient

public extension ReqresClient {
    static var live: Self {
        let client = HttpClient()
        return Self(
            getUserList: { page in
                let request = HttpRequest(
                    method: .get,
                    url: ReqresClient.baseURL,
                    path: "/api/users",
                    params: [
                        "page": page,
                        "delay": 0
                    ]
                )
                return client.performRequest(request: request.urlRequest, response: ReqresResult.self)
                    .map { $0.data }
                    .mapError { error in
                        ReqresError(error: error.message)
                    }
                    .eraseToAnyPublisher()
            },
            getUserById: { id in
                let request = HttpRequest(
                    method: .get,
                    url: ReqresClient.baseURL,
                    path: "/api/users/\(id)"
                )
                return client.performRequest(request: request.urlRequest, response: UserResult.self)
                    .map { $0.data }
                    .mapError { error in
                        ReqresError(error: error.message)
                    }
                    .eraseToAnyPublisher()
            },
            updateUser: { id, name, job in
                let request = HttpRequest(
                    method: .put,
                    url: ReqresClient.baseURL,
                    path: "/api/users/\(id)",
                    params: [
                        "name": name,
                        "job": job
                    ],
                    encoding: JSONEncoding.default
                )
                return client.performRequest(request: request.urlRequest, response: UserUpdate.self)
                    .mapError { error in
                        ReqresError(error: error.message)
                    }
                    .eraseToAnyPublisher()
            }
        )
    }
}
