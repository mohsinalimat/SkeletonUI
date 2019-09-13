import SwiftUI

class SkeletonViewModel {
    let loading: Bool
    var shape = ShapeViewModel()
    var multiline = MultilineViewModel()
    var appearance = AppearanceViewModel()
    var animation = AnimationViewModel()

    init(loading: Bool) {
        self.loading = loading
    }
}
