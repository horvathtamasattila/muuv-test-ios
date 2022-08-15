import Foundation

public extension ReqresClient {
    // swiftlint:disable force_cast force_unwrapping
    static let baseURL = "https://\(Bundle.main.object(forInfoDictionaryKey: "REQRES_URL") as! String)"
}

public struct ReqresResult<T>: Decodable where T: Decodable {
    public let results: [T]
}

public struct ReqresError: Error {
    public let message: String?

    public init(error: String?) {
        self.message = error
    }
}
