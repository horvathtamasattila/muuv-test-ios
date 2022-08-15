import Combine
import SwiftUI

final class Coordinator: ObservableObject {
    @Published var presentedView: Views

    public init() {
        presentedView = .list
        setInitialView()
    }

    func setInitialView() {
        unowned let unownedSelf = self
        DispatchQueue.main.async {
            unownedSelf.presentedView = .list
        }
    }

    var isShowingList: Binding<Bool> {
        unowned let unownedSelf = self
        return Binding<Bool>(
            get: { unownedSelf.presentedView == .list || unownedSelf.presentedView == .detail },
            set: { _ in }
        )
    }

    var isShowingDetail: Binding<Bool> {
        unowned let unownedSelf = self
        return Binding<Bool>(
            get: { unownedSelf.presentedView == .detail },
            set: { _ in }
        )
    }

    func changeView(to view: Views) {
        presentedView = view
    }
}

enum Views {
    case list
    case detail
}
