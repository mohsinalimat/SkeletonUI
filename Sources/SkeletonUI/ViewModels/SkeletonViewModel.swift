import SwiftUI

protocol SkeletonViewModelable {
    var loading: Bool { get }
    var shape: ShapeViewModel { get }
    var multiline: MultilineViewModel { get }
    var appearance: AppearanceViewModel { get }
    var animation: AnimationViewModel { get }
}

final class SkeletonViewModel: SkeletonViewModelable {
    let loading: Bool
    var shape = ShapeViewModel()
    var multiline = MultilineViewModel()
    var appearance = AppearanceViewModel()
    var animation = AnimationViewModel()

    init(loading: Bool) {
        self.loading = loading
    }
}
