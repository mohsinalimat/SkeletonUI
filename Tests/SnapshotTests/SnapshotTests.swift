import SkeletonUI
import SnapshotTesting
import SwiftUI
import XCTest

final class SnapshotTests: XCTestCase {
    @State private var text: String = ""
    @State private var isOn: Bool = false

    func testDefaultText() {
        let view = Text(nil).skeleton(with: true)
        assertNamedSnapshot(matching: view, as: .image, size: CGSize(width: 100, height: 50))
    }

    func testDefaultImage() {
        #if os(macOS)
            let view = Image(nsImage: nil).skeleton(with: true)
        #else
            let view = Image(uiImage: nil).skeleton(with: true)
        #endif
        assertNamedSnapshot(matching: view, as: .image, size: CGSize(width: 100, height: 100))
    }

    func testDefaultTextField() {
        let view = TextField(nil, text: $text).skeleton(with: true)
        assertNamedSnapshot(matching: view, as: .image, size: CGSize(width: 100, height: 50))
    }

    func testDefaultToggle() {
        let view = Toggle(nil, isOn: $isOn).skeleton(with: true)
        assertNamedSnapshot(matching: view, as: .image, size: CGSize(width: 100, height: 50))
    }
}
