import Foundation

final class UserRepository {
    private var _selectedUserId: Int?

    public var selectedUserId: Int? {
        get { _selectedUserId }
        set { _selectedUserId = newValue }
    }
}
