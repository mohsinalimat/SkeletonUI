import SwiftUI

typealias Angles = (start: Angle, end: Angle)

protocol AngleViewModelable: ObservableObject {
    var value: Double { get }
    var animation: Animation? { get }
    var range: ClosedRange<Double> { get }
    var values: Angles { get }
}

final class AngleViewModel: AngleViewModelable {
    @Published var value: Double = .zero
    var animation: Animation?
    var range: ClosedRange<Double> = .zero ... 360 {
        didSet {
            value = range.lowerBound
        }
    }

    var values: Angles {
        (start: .zero, end: .degrees(value))
    }
}
