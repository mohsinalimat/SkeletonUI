import SwiftUI

struct SkeletonView: View {
    let skeleton: SkeletonViewModel
    let line: Int

    var body: some View {
        GeometryReader { geometry in
            SkeletonShape(skeleton: self.skeleton)
                .frame(width: (self.skeleton.loading ? self.skeleton.multiline.scales?[self.line] ?? 1 : 1) * geometry.size.width, height: geometry.size.height)
                .onAppear {
                    withAnimation(self.skeleton.animation.position.animation) {
                        self.skeleton.animation.position.value = self.skeleton.animation.position.range.upperBound
                    }
                    withAnimation(self.skeleton.animation.opacity.animation) {
                        self.skeleton.animation.opacity.value = self.skeleton.animation.opacity.range.upperBound
                    }
                    withAnimation(self.skeleton.animation.radius.animation) {
                        self.skeleton.animation.radius.value = self.skeleton.animation.radius.range.upperBound
                    }
                    withAnimation(self.skeleton.animation.angle.animation) {
                        self.skeleton.animation.angle.value = self.skeleton.animation.angle.range.upperBound
                    }
                }
        }
    }
}
