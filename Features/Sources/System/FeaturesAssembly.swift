import Swinject
import SwinjectAutoregistration

public class FeaturesAssembly: Assembly {
    public init() {}
    public func assemble(container: Container) {
        container.autoregister(ListViewModel.self, initializer: ListViewModel.init)
        container.autoregister(DetailViewModel.self, initializer: DetailViewModel.init)
        container.autoregister(UsersUseCase.self, initializer: UsersUseCase.init)
        container.autoregister(UserRepository.self, initializer: UserRepository.init).inObjectScope(.container)
        container.autoregister(Coordinator.self, initializer: Coordinator.init).inObjectScope(.container)
    }
}
