import SwiftUI

protocol MultilineInteractable {
    var lines: Int { get set }
    var spacing: CGFloat? { get set }
    var scales: [Int: CGFloat]? { get set }

    func scale(loading: Bool, line: Int) -> CGFloat
}

final class MultilineInteractor: MultilineInteractable {
    var lines: Int = 1
    var spacing: CGFloat?
    var scales: [Int: CGFloat]?

    func scale(loading: Bool, line: Int) -> CGFloat {
        loading ? scales?[line] ?? 1 : 1
    }
}
