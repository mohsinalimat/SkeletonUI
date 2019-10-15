import SwiftUI

protocol OpacityViewModelable: ObservableObject {
    var value: Double { get }
    var animation: Animation? { get }
    var range: ClosedRange<Double> { get }
}

final class OpacityViewModel: OpacityViewModelable {
    @Published var value: Double = .zero
    var animation: Animation?
    var range: ClosedRange<Double> = .zero ... 1 {
        didSet {
            value = range.lowerBound
        }
    }
}
