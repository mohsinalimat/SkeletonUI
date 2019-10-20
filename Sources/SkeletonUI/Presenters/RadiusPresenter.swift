import SwiftUI

typealias Radii = (start: CGFloat, end: CGFloat)

final class RadiusPresenter: ObservableObject {
    @Published var value: CGFloat = .zero
    var range: ClosedRange<CGFloat> = 1 ... 40 {
        didSet {
            value = range.lowerBound
        }
    }

    var values: Radii {
        (start: .zero, end: value)
    }
}
