import SwiftUI

public enum AnimationType {
    case none
    case pulse(opacity: ClosedRange<Double> = .zero ... 1, duration: Double = 0.75, delay: Double = 0, autoreverses: Bool = true)
    case linear(range: ClosedRange<CGFloat> = .zero ... 1, duration: Double = 1, delay: Double = 0.25, autoreverses: Bool = false)
}

protocol AnimationViewModelable {
    var position: PositionViewModel { get }
    var opacity: OpacityViewModel { get }
    var radius: RadiusViewModel { get }
    var angle: AngleViewModel { get }
    var type: AnimationType { get }
}

final class AnimationViewModel: AnimationViewModelable {
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
