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
