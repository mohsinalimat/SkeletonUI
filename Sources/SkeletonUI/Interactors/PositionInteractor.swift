import SwiftUI

protocol PositionInteractable {
    var presenter: PositionPresenter { get }
    var animation: Animation? { get set }
}

final class PositionInteractor: PositionInteractable {
    let presenter: PositionPresenter
    var animation: Animation?

    required init() {
        presenter = PositionPresenter()
    }
}