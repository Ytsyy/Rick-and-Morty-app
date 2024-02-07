
import UIKit

final class PersonCoordinator: BaseCoordinator<PersonCoordinator.Context> {
    struct Context {
        let data: CharacterCellData
    }

    override func make() -> UIViewController? {
        assembly.personVC(data: context.data)
    }
}
