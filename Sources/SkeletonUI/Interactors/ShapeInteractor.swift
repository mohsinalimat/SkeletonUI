import SwiftUI

public enum RoundedType: Equatable {
    case radius(CGFloat, style: RoundedCornerStyle = .continuous)
    case size(CGSize, style: RoundedCornerStyle = .continuous)
}

public enum ShapeType: Equatable {
    case rounded(RoundedType)
    case rectangle
    case circle
    case ellipse
    case capsule
}

protocol ShapeInteractable {
    var type: ShapeType { get set }

    func path(in rect: CGRect) -> Path
}

final class ShapeInteractor: ShapeInteractable {
    var type: ShapeType = .capsule

    func path(in rect: CGRect) -> Path {
        switch type {
        case let .rounded(.radius(radius, style)):
            return RoundedRectangle(cornerRadius: radius, style: style).path(in: rect)
        case let .rounded(.size(size, style)):
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
