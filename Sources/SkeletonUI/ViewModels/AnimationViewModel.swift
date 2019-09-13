import SwiftUI

typealias UnitPoints = (start: UnitPoint, end: UnitPoint)
typealias Radii = (start: CGFloat, end: CGFloat)
typealias Angles = (start: Angle, end: Angle)

class PositionViewModel: ObservableObject {
    @Published var value: CGFloat = .zero
    var animation: Animation? = nil
    var range: ClosedRange<CGFloat> = .zero...1 {
        didSet {
            value = range.lowerBound
        }
    }
    var values: UnitPoints {
        return (start: UnitPoint(x: value - 1, y: 0.5), end: UnitPoint(x: value + 1, y: 0.5))
    }
}

class OpacityViewModel: ObservableObject {
    @Published var value: Double = .zero
    var animation: Animation? = nil
    var range: ClosedRange<Double> = .zero...1 {
        didSet {
            value = range.lowerBound
        }
    }
}

class RadiusViewModel: ObservableObject {
    @Published var value: CGFloat = .zero
    var animation: Animation? = nil
    var range: ClosedRange<CGFloat> = 1...40 {
        didSet {
            value = range.lowerBound
        }
    }
    var values: Radii {
        return (start: .zero, end: value)
    }
}

class AngleViewModel: ObservableObject {
    @Published var value: Double = .zero
    var animation: Animation? = nil
    var range: ClosedRange<Double> = .zero...360 {
        didSet {
            value = range.lowerBound
        }
    }
    var values: Angles {
        return (start: .zero, end: .degrees(value))
    }
}

public enum AnimationType {
    case none
    case pulse(opacity: ClosedRange<Double> = .zero...1, duration: Double = 0.75, delay: Double = 0, autoreverses: Bool = true)
    case linear(range: ClosedRange<CGFloat> = .zero...1, duration: Double = 1, delay: Double = 0.25, autoreverses: Bool = false)
}

struct AnimationViewModel {
    let position = PositionViewModel()
    let opacity = OpacityViewModel()
    let radius = RadiusViewModel()
    let angle = AngleViewModel()
    var type: AnimationType = .none {
        didSet {
            switch type {
            case .none:
                break
            case .pulse(let opacity, let duration, let delay, let autoreverses):
                self.opacity.range = opacity
                self.opacity.animation = Animation.easeIn(duration: duration).delay(delay).repeatForever(autoreverses: autoreverses)
            case .linear(let range, let duration, let delay, let autoreverses):
                self.position.range = self.position.range.normalize(with: range)
                self.radius.range = self.radius.range.normalize(with: range)
                self.angle.range = self.angle.range.normalize(with: range)
                self.position.animation = Animation.easeInOut(duration: duration).delay(delay).repeatForever(autoreverses: autoreverses)
                self.radius.animation = Animation.easeInOut(duration: duration).delay(delay).repeatForever(autoreverses: autoreverses)
                self.angle.animation = Animation.easeInOut(duration: duration).delay(delay).repeatForever(autoreverses: autoreverses)
                self.opacity.animation = autoreverses ? nil : Animation.easeIn(duration: (duration + delay) / 2).repeatForever(autoreverses: true)
            }
        }
    }
}
