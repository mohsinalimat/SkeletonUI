import SwiftUI

protocol OpacityInteractable {
    var presenter: OpacityPresenter { get }
    var animation: Animation? { get set }
}

final class OpacityInteractor: OpacityInteractable {
    let presenter: OpacityPresenter
    var animation: Animation?

    required init() {
        presenter = OpacityPresenter()
    }
}

struct OpacityInteractableMock: OpacityInteractable {
    var presenter: OpacityPresenter
    var animation: Animation?

    init() {
        presenter = OpacityPresenter()
        presenter.range = 0.5 ... 0.75
    }
}
