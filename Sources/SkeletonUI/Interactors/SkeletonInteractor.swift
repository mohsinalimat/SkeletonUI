import SwiftUI

protocol SkeletonInteractable {
    var loading: Bool { get }
    var shape: ShapeInteractor { get }
    var multiline: MultilineInteractor { get }
    var appearance: AppearanceInteractor { get }
    var animation: AnimationInteractor { get }
}

final class SkeletonInteractor: SkeletonInteractable {
    let loading: Bool
    var shape = ShapeInteractor()
    var multiline = MultilineInteractor()
    var appearance = AppearanceInteractor()
    var animation = AnimationInteractor()

    init(loading: Bool) {
        self.loading = loading
    }
}
