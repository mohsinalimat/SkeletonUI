import SwiftUI

protocol OpacityInteractable {
    var presenter: OpacityPresenter { get }
    var animation: Animation? { get }
}

final class OpacityInteractor: OpacityInteractable {
    let presenter: OpacityPresenter
    var animation: Animation?

    required init() {
        presenter = OpacityPresenter()
    }
}
