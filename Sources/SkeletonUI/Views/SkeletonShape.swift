import SwiftUI

struct SkeletonShape: Shape {
    let skeleton: SkeletonViewModel
    @ObservedObject private var position: PositionViewModel
    @ObservedObject private var opacity: OpacityViewModel
    @ObservedObject private var radius: RadiusViewModel
    @ObservedObject private var angle: AngleViewModel

    init(skeleton: SkeletonViewModel) {
        self.skeleton = skeleton
        self.position = skeleton.animation.position
        self.opacity = skeleton.animation.opacity
        self.radius = skeleton.animation.radius
        self.angle = skeleton.animation.angle
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
