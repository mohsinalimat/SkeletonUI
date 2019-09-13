import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public extension ModifiedContent where Content: View, Modifier == SkeletonModifier {
    func animation(type: AnimationType) -> ModifiedContent<Content, SkeletonModifier> {
        modifier.skeleton.animation.type = type
        return self
    }

    func appearance(type: AppearanceType) -> ModifiedContent<Content, SkeletonModifier> {
        modifier.skeleton.appearance.type = type
        return self
    }
    
    func multiline(lines: Int, scales: [Int: CGFloat]? = nil, spacing: CGFloat? = nil) -> ModifiedContent<Content, SkeletonModifier> {
        modifier.skeleton.multiline.lines = lines
        if let scales = scales {
            modifier.skeleton.multiline.scales = scales
        }
        if let spacing = spacing {
            modifier.skeleton.multiline.spacing = spacing
        }
        return self
    }
    
    func shape(type: ShapeType) -> ModifiedContent<Content, SkeletonModifier> {
        modifier.skeleton.shape.type = type
        return self
    }
}
