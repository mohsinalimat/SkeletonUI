import SwiftUI

public enum GradientType {
    case linear
    case angular
    case radial
}

public enum AppearanceType {
    case solid(color: Color = Color(.systemGray4), background: Color = Color(.systemGray6))
    case gradient(GradientType = .linear, color: Color = Color(.systemGray4), background: Color = Color(.systemGray6))
}

struct AppearanceViewModel {
    var type: AppearanceType = .solid()

    func view<S>(shape: S, points: UnitPoints, opacity: Double, radii: Radii, angles: Angles) -> some View where S: Shape {
        switch type {
        case .solid(let color, let background):
            return AnyView(ZStack {
                shape.fill(background)
                shape.fill(color)
                    .opacity(opacity)
            })
        case .gradient(.linear, let color, let background):
            return AnyView(ZStack {
                shape.fill(background)
                shape.fill(LinearGradient(gradient: Gradient(colors: [background, color, background]), startPoint: points.start, endPoint: points.end))
                    .opacity(opacity)
            })
        case .gradient(.radial, let color, let background):
            return AnyView(ZStack {
                shape.fill(background)
                shape.fill(RadialGradient(gradient: Gradient(colors: [color, background]), center: .center, startRadius: radii.start, endRadius: radii.end))
                    .opacity(opacity)
            })
        case .gradient(.angular, let color, let background):
            return AnyView(ZStack {
                shape.fill(background)
                shape.fill(AngularGradient(gradient: Gradient(colors: [background, color, background]), center: .center, startAngle: angles.start, endAngle: angles.end))
                    .opacity(opacity)
            })
        }
    }
}
