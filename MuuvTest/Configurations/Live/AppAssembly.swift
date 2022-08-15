import ReqresClient
import ReqresClientLive
import Swinject
import SwinjectAutoregistration

class AppAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ReqresClient.self, factory: { _ in .live })
    }
}
