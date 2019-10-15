import SwiftUI

typealias UnitPoints = (start: UnitPoint, end: UnitPoint)

protocol PositionViewModelable: ObservableObject {
    var value: CGFloat { get }
    var animation: Animation? { get }
    var range: ClosedRange<CGFloat> { get }
    var values: UnitPoints { get }
}

final class PositionViewModel: PositionViewModelable {
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
