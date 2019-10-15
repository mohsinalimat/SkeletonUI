import SwiftUI

typealias Radii = (start: CGFloat, end: CGFloat)

protocol RadiusViewModelable: ObservableObject {
    var value: CGFloat { get }
    var animation: Animation? { get }
    var range: ClosedRange<CGFloat> { get }
    var values: Radii { get }
}

final class RadiusViewModel: RadiusViewModelable {
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
