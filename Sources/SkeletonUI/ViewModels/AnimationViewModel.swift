import SwiftUI

public enum AnimationType {
    case none
    case pulse(opacity: ClosedRange<Double> = .zero ... 1, duration: Double = 2, delay: Double = 1, speed: Double = 2, autoreverses: Bool = true)
    case linear(range: ClosedRange<CGFloat> = .zero ... 1, duration: Double = 4, delay: Double = 1, speed: Double = 5, autoreverses: Bool = false)
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
            case let .pulse(opacity, duration, delay, speed, autoreverses):
                self.opacity.range = opacity
                self.opacity.animation = Animation.easeIn(duration: duration).delay(delay).speed(speed).repeatForever(autoreverses: autoreverses)
            case let .linear(range, duration, delay, speed, autoreverses):
                position.range = position.range.normalize(with: range)
                radius.range = radius.range.normalize(with: range)
                angle.range = angle.range.normalize(with: range)
                position.animation = Animation.easeInOut(duration: duration).delay(delay).speed(speed).repeatForever(autoreverses: autoreverses)
                opacity.animation = autoreverses ? nil : Animation.easeIn(duration: duration).delay(delay).speed(speed * 2).repeatForever(autoreverses: true)
                radius.animation = Animation.easeInOut(duration: duration).delay(delay).speed(speed).repeatForever(autoreverses: autoreverses)
                angle.animation = Animation.easeInOut(duration: duration).delay(delay).speed(speed).repeatForever(autoreverses: autoreverses)
            }
        }
    }
}
