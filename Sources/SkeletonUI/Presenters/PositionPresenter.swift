import SwiftUI

typealias UnitPoints = (start: UnitPoint, end: UnitPoint)

final class PositionPresenter: ObservableObject {
    @Published var value: CGFloat = .zero
    var range: ClosedRange<CGFloat> = .zero ... 1 {
        didSet {
            value = range.lowerBound
        }
    }

    var values: UnitPoints {
        (start: UnitPoint(x: value - 1, y: 0.5), end: UnitPoint(x: value + 1, y: 0.5))
    }
}
