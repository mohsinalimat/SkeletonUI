import SwiftUI

public enum AnimationType: Equatable {
    case none
    case pulse(opacity: ClosedRange<Double> = .zero ... 1, duration: Double = 2, delay: Double = 1, speed: Double = 2, autoreverses: Bool = true)
    case linear(range: ClosedRange<CGFloat> = .zero ... 1, duration: Double = 4, delay: Double = 1, speed: Double = 5, autoreverses: Bool = false)
}

protocol AnimationInteractable {
    var position: PositionInteractable { get set }
    var opacity: OpacityInteractable { get set }
    var radius: RadiusInteractable { get set }
    var angle: AngleInteractable { get set }
    var type: AnimationType { get set }
}

final class AnimationInteractor: AnimationInteractable {
    var position: PositionInteractable
    var opacity: OpacityInteractable
    var radius: RadiusInteractable
    var angle: AngleInteractable
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

    init(position: PositionInteractable = PositionInteractor(), opacity: OpacityInteractable = OpacityInteractor(), radius: RadiusInteractable = RadiusInteractor(), angle: AngleInteractable = AngleInteractor()) {
        self.position = position
        self.opacity = opacity
        self.radius = radius
        self.angle = angle
    }
}
