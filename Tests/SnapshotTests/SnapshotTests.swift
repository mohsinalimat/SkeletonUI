import SkeletonUI
import SnapshotTesting
import SwiftUI
import XCTest

final class SnapshotTests: XCTestCase {
    @State private var text: String = ""
    @State private var isOn: Bool = false

    func testDefaultText() {
        let view = Text(nil)
            .skeleton(with: true)
            .frame(width: 100, height: 50)
        assertNamedSnapshot(matching: view, as: .image)
    }

    func testDefaultImage() {
        let view = Image(uiImage: nil)
            .skeleton(with: true)
            .frame(width: 100, height: 100)
        assertNamedSnapshot(matching: view, as: .image)
    }

    func testDefaultTextField() {
        let view = TextField(nil, text: $text)
            .skeleton(with: true)
            .frame(width: 100, height: 50)
        assertNamedSnapshot(matching: view, as: .image)
    }

    func testDefaultToggle() {
        let view = Toggle(nil, isOn: $isOn)
            .skeleton(with: true)
            .frame(width: 100, height: 50)
        assertNamedSnapshot(matching: view, as: .image)
    }
}
