import SwiftUI

struct SkeletonShape: Shape {
    private let skeleton: SkeletonInteractor
    @ObservedObject private var position: PositionPresenter
    @ObservedObject private var opacity: OpacityPresenter
    @ObservedObject private var radius: RadiusPresenter
    @ObservedObject private var angle: AnglePresenter

    init(skeleton: SkeletonInteractor) {
        self.skeleton = skeleton
        position = skeleton.animation.position.presenter
        opacity = skeleton.animation.opacity.presenter
        radius = skeleton.animation.radius.presenter
        angle = skeleton.animation.angle.presenter
    }

    func path(in rect: CGRect) -> Path {
        skeleton
            .shape
            .path(in: rect)
    }

    var body: some View {
        skeleton
            .appearance
            .view(shape: self,
                  points: position.values,
                  opacity: opacity.value,
                  radii: radius.values,
                  angles: angle.values)
    }
}
