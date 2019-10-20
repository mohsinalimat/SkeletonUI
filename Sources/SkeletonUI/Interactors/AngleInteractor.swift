import SwiftUI

protocol AngleInteractable {
    var presenter: AnglePresenter { get }
    var animation: Animation? { get set }
}

final class AngleInteractor: AngleInteractable {
    let presenter: AnglePresenter
    var animation: Animation?

    required init() {
        presenter = AnglePresenter()
    }
}

struct AngleInteractableMock: AngleInteractable {
    var presenter: AnglePresenter
    var animation: Animation?

    init() {
        presenter = AnglePresenter()
        presenter.range = 50 ... 100
    }
}
