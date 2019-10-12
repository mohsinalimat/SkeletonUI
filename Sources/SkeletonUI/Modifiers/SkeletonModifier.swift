import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SkeletonModifier: ViewModifier {
    let skeleton: SkeletonViewModel

    public func body(content: Content) -> some View {
        if skeleton.loading {
            return AnyView(VStack(spacing: skeleton.multiline.spacing) {
                ForEach(0 ..< skeleton.multiline.lines) { line in
                    SkeletonView(skeleton: self.skeleton, line: line)
                }
            })
        } else {
            return AnyView(content)
        }
    }
}
