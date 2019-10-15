import SwiftUI

protocol MultilineViewModelable {
    var lines: Int { get }
    var spacing: CGFloat? { get }
    var scales: [Int: CGFloat]? { get }
}

final class MultilineViewModel: MultilineViewModelable {
    var lines: Int = 1
    var spacing: CGFloat?
    var scales: [Int: CGFloat]?
}
