import SwiftUI

typealias Angles = (start: Angle, end: Angle)

final class AnglePresenter: ObservableObject {
    @Published var value: Double = .zero
    var range: ClosedRange<Double> = .zero ... 360 {
        didSet {
            value = range.lowerBound
        }
    }

    var values: Angles {
        (start: .zero, end: .degrees(value))
    }
}
