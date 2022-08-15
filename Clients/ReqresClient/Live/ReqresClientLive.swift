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
                        "page": page
                    ]
                )
                return client.performRequest(request: request.urlRequest, response: ReqresResult.self)
                    .map { $0.data }
                    .mapError { error in
                        ReqresError(error: error.message)
                    }
                    .eraseToAnyPublisher()
            }
        )
    }
}
