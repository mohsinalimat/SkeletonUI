import SwiftUI

protocol RadiusInteractable {
    var presenter: RadiusPresenter { get }
    var animation: Animation? { get set }
}

final class RadiusInteractor: RadiusInteractable {
    let presenter: RadiusPresenter
    var animation: Animation?

    required init() {
        presenter = RadiusPresenter()
    }
}

struct RadiusInteractableMock: RadiusInteractable {
    var presenter: RadiusPresenter
    var animation: Animation?

    init() {
        presenter = RadiusPresenter()
        presenter.range = 10 ... 30
    }
}
