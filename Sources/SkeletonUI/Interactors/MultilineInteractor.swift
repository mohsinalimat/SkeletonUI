import SwiftUI

protocol MultilineInteractable {
    var lines: Int { get }
    var spacing: CGFloat? { get }
    var scales: [Int: CGFloat]? { get }
}

final class MultilineInteractor: MultilineInteractable {
    var lines: Int = 1
    var spacing: CGFloat?
    var scales: [Int: CGFloat]?
}
