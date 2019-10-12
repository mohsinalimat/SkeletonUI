import SkeletonUI
import SnapshotTesting
import SwiftUI
import XCTest

final class SnapshotTests: XCTestCase {
    func testExample() {
        let view = Text(nil).skeleton(with: true)
        record = false
        let hostingController = UIHostingController(rootView: view)
        assertSnapshot(matching: hostingController, as: .image(size: .init(width: 300, height: 300)))
        XCTAssert(true)
    }

    static var allTests = [
        ("testExample", testExample)
    ]
}
