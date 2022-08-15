import Swinject
import SwinjectAutoregistration

public class FeaturesAssembly: Assembly {
    public init() {}
    public func assemble(container: Container) {
        container.autoregister(ListViewModel.self, initializer: ListViewModel.init)

        container.autoregister(UsersUseCase.self, initializer: UsersUseCase.init)
    }
}
