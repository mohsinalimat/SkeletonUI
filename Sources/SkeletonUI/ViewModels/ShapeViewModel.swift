import SwiftUI

public enum RoundedType {
    case radius(CGFloat, style: RoundedCornerStyle = .continuous)
    case size(CGSize, style: RoundedCornerStyle = .continuous)
}

public enum ShapeType {
    case rounded(RoundedType)
    case rectangle
    case circle
    case ellipse
    case capsule
}

struct ShapeViewModel {
    var type: ShapeType = .capsule

    func path(in rect: CGRect) -> Path {
        switch type {
        case .rounded(.radius(let radius, let style)):
            return RoundedRectangle(cornerRadius: radius, style: style).path(in: rect)
        case .rounded(.size(let size, let style)):
            return RoundedRectangle(cornerSize: size, style: style).path(in: rect)
        case .rectangle:
            return Rectangle().path(in: rect)
        case .circle:
            return Circle().path(in: rect)
        case .ellipse:
            return Ellipse().path(in: rect)
        case .capsule:
            return Capsule().path(in: rect)
        }
    }

}
