import SwiftUI

protocol MultilineInteractable {
    var lines: Int { get set }
    var spacing: CGFloat? { get set }
    var scales: [Int: CGFloat]? { get set }
}

final class MultilineInteractor: MultilineInteractable {
    var lines: Int = 1
    var spacing: CGFloat?
    var scales: [Int: CGFloat]?
}
