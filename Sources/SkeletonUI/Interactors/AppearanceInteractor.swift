import SwiftUI

public enum GradientType {
    case linear
    case angular
    case radial
}

#if os(iOS)
    public enum AppearanceType {
        case solid(color: Color = Color(.systemGray4), background: Color = Color(.systemGray6))
        case gradient(GradientType = .linear, color: Color = Color(.systemGray4), background: Color = Color(.systemGray6))
    }

#elseif os(tvOS)
    public enum AppearanceType {
        case solid(color: Color = Color(.tertiaryLabel), background: Color = Color(.secondaryLabel))
        case gradient(GradientType = .linear, color: Color = Color(.tertiaryLabel), background: Color = Color(.secondaryLabel))
    }

#elseif os(watchOS)
    public enum AppearanceType {
        case solid(color: Color = .secondary, background: Color = .primary)
        case gradient(GradientType = .linear, color: Color = .secondary, background: Color = .primary)
    }

#elseif os(OSX)
    public enum AppearanceType {
        case solid(color: Color = Color(.alternateSelectedControlColor), background: Color = Color(.unemphasizedSelectedContentBackgroundColor))
        case gradient(GradientType = .linear, color: Color = Color(.alternateSelectedControlColor), background: Color = Color(.unemphasizedSelectedContentBackgroundColor))
    }
#endif

protocol AppearanceInteractable {
    var type: AppearanceType { get }
    func view<S>(shape: S, points: UnitPoints, opacity: Double, radii: Radii, angles: Angles) -> AnyView where S: Shape
}

final class AppearanceInteractor: AppearanceInteractable {
    var type: AppearanceType = .gradient()

    func view<S>(shape: S, points: UnitPoints, opacity: Double, radii: Radii, angles: Angles) -> AnyView where S: Shape {
        switch type {
        case let .solid(color, background):
            return AnyView(ZStack {
                shape.fill(background)
                shape.fill(color)
                    .opacity(opacity)
            })
        case let .gradient(.linear, color, background):
            return AnyView(ZStack {
                shape.fill(background)
                shape.fill(LinearGradient(gradient: Gradient(colors: [background, color, background]), startPoint: points.start, endPoint: points.end))
                    .opacity(opacity)
            })
        case let .gradient(.radial, color, background):
            return AnyView(ZStack {
                shape.fill(background)
                shape.fill(RadialGradient(gradient: Gradient(colors: [color, background]), center: .center, startRadius: radii.start, endRadius: radii.end))
                    .opacity(opacity)
            })
        case let .gradient(.angular, color, background):
            return AnyView(ZStack {
                shape.fill(background)
                shape.fill(AngularGradient(gradient: Gradient(colors: [background, color, background]), center: .center, startAngle: angles.start, endAngle: angles.end))
                    .opacity(opacity)
            })
        }
    }
}
