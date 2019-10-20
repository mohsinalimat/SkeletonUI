import SwiftUI

final class OpacityPresenter: ObservableObject {
    @Published var value: Double = .zero
    var range: ClosedRange<Double> = .zero ... 1 {
        didSet {
            value = range.lowerBound
        }
    }
}
