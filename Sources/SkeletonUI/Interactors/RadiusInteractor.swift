import SwiftUI

protocol RadiusInteractable {
    var presenter: RadiusPresenter { get }
    var animation: Animation? { get }
}

final class RadiusInteractor: RadiusInteractable {
    let presenter: RadiusPresenter
    var animation: Animation?

    required init() {
        presenter = RadiusPresenter()
    }
}
