import SwiftUI

public enum AnimationType {
    case none
    case pulse(opacity: ClosedRange<Double> = .zero ... 1, duration: Double = 2, delay: Double = 1, speed: Double = 2, autoreverses: Bool = true)
    case linear(range: ClosedRange<CGFloat> = .zero ... 1, duration: Double = 4, delay: Double = 1, speed: Double = 5, autoreverses: Bool = false)
}

protocol AnimationInteractable {
    var position: PositionInteractor { get }
    var opacity: OpacityInteractor { get }
    var radius: RadiusInteractor { get }
    var angle: AngleInteractor { get }
    var type: AnimationType { get }
}

final class AnimationInteractor: AnimationInteractable {
    let position = PositionInteractor()
    let opacity = OpacityInteractor()
    let radius = RadiusInteractor()
    let angle = AngleInteractor()
    var type: AnimationType = .linear() {
        didSet {
            switch type {
            case .none:
                break
            case let .pulse(opacity, duration, delay, speed, autoreverses):
                self.opacity.presenter.range = opacity
                self.opacity.animation = Animation.easeIn(duration: duration).delay(delay).speed(speed).repeatForever(autoreverses: autoreverses)
            case let .linear(range, duration, delay, speed, autoreverses):
                position.presenter.range = position.presenter.range.normalize(with: range)
                radius.presenter.range = radius.presenter.range.normalize(with: range)
                angle.presenter.range = angle.presenter.range.normalize(with: range)
                position.animation = Animation.easeInOut(duration: duration).delay(delay).speed(speed).repeatForever(autoreverses: autoreverses)
                opacity.animation = autoreverses ? nil : Animation.easeIn(duration: duration).delay(delay).speed(speed * 2).repeatForever(autoreverses: true)
                radius.animation = Animation.easeInOut(duration: duration).delay(delay).speed(speed).repeatForever(autoreverses: autoreverses)
                angle.animation = Animation.easeInOut(duration: duration).delay(delay).speed(speed).repeatForever(autoreverses: autoreverses)
            }
        }
    }
}
