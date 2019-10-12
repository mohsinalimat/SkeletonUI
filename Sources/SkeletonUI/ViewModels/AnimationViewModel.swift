import SwiftUI

typealias UnitPoints = (start: UnitPoint, end: UnitPoint)
typealias Radii = (start: CGFloat, end: CGFloat)
typealias Angles = (start: Angle, end: Angle)

class PositionViewModel: ObservableObject {
    @Published var value: CGFloat = .zero
    var animation: Animation?
    var range: ClosedRange<CGFloat> = .zero ... 1 {
        didSet {
            value = range.lowerBound
        }
    }

    var values: UnitPoints {
        (start: UnitPoint(x: value - 1, y: 0.5), end: UnitPoint(x: value + 1, y: 0.5))
    }
}

class OpacityViewModel: ObservableObject {
    @Published var value: Double = .zero
    var animation: Animation?
    var range: ClosedRange<Double> = .zero ... 1 {
        didSet {
            value = range.lowerBound
        }
    }
}

class RadiusViewModel: ObservableObject {
    @Published var value: CGFloat = .zero
    var animation: Animation?
    var range: ClosedRange<CGFloat> = 1 ... 40 {
        didSet {
            value = range.lowerBound
        }
    }

    var values: Radii {
        (start: .zero, end: value)
    }
}

class AngleViewModel: ObservableObject {
    @Published var value: Double = .zero
    var animation: Animation?
    var range: ClosedRange<Double> = .zero ... 360 {
        didSet {
            value = range.lowerBound
        }
    }

    var values: Angles {
        (start: .zero, end: .degrees(value))
    }
}

public enum AnimationType {
    case none
    case pulse(opacity: ClosedRange<Double> = .zero ... 1, duration: Double = 0.75, delay: Double = 0, autoreverses: Bool = true)
    case linear(range: ClosedRange<CGFloat> = .zero ... 1, duration: Double = 1, delay: Double = 0.25, autoreverses: Bool = false)
}

struct AnimationViewModel {
    let position = PositionViewModel()
    let opacity = OpacityViewModel()
    let radius = RadiusViewModel()
    let angle = AngleViewModel()
    var type: AnimationType = .linear() {
        didSet {
            switch type {
            case .none:
                break
            case let .pulse(opacity, duration, delay, autoreverses):
                self.opacity.range = opacity
                self.opacity.animation = Animation.easeIn(duration: duration).delay(delay).repeatForever(autoreverses: autoreverses)
            case let .linear(range, duration, delay, autoreverses):
                position.range = position.range.normalize(with: range)
                radius.range = radius.range.normalize(with: range)
                angle.range = angle.range.normalize(with: range)
                position.animation = Animation.easeInOut(duration: duration).delay(delay).repeatForever(autoreverses: autoreverses)
                radius.animation = Animation.easeInOut(duration: duration).delay(delay).repeatForever(autoreverses: autoreverses)
                angle.animation = Animation.easeInOut(duration: duration).delay(delay).repeatForever(autoreverses: autoreverses)
                opacity.animation = autoreverses ? nil : Animation.easeIn(duration: (duration + delay) / 2).repeatForever(autoreverses: true)
            }
        }
    }
}
