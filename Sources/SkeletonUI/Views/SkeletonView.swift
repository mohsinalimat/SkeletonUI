import SwiftUI

struct SkeletonView: View {
    let skeleton: SkeletonInteractor
    let line: Int

    var body: some View {
        GeometryReader { geometry in
            SkeletonShape(skeleton: self.skeleton)
                .frame(width: self.skeleton.multiline.scale(loading: self.skeleton.loading, line: self.line) * geometry.size.width, height: geometry.size.height)
                .onAppear {
                    withAnimation(self.skeleton.animation.position.animation) {
                        self.skeleton.animation.position.presenter.value = self.skeleton.animation.position.presenter.range.upperBound
                    }
                    withAnimation(self.skeleton.animation.opacity.animation) {
                        self.skeleton.animation.opacity.presenter.value = self.skeleton.animation.opacity.presenter.range.upperBound
                    }
                    withAnimation(self.skeleton.animation.radius.animation) {
                        self.skeleton.animation.radius.presenter.value = self.skeleton.animation.radius.presenter.range.upperBound
                    }
                    withAnimation(self.skeleton.animation.angle.animation) {
                        self.skeleton.animation.angle.presenter.value = self.skeleton.animation.angle.presenter.range.upperBound
                    }
                }
        }
    }
}
