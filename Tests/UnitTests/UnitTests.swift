@testable import SkeletonUI
import SwiftUI
import XCTest

final class UnitTests: XCTestCase {
    func testDefaultAngle() {
        let animation = AngleInteractableMock()
        XCTAssertTrue(animation.presenter.values == (start: .zero, end: .degrees(50)))
    }

    func testDefaultOpacity() {
        let opacity = OpacityInteractableMock()
        XCTAssertTrue(opacity.presenter.value == 0.5)
    }

    func testDefaultPosition() {
        let position = PositionInteractableMock()
        XCTAssertTrue(position.presenter.values == (start: UnitPoint(x: -0.75, y: 0.5), end: UnitPoint(x: 1.25, y: 0.5)))
    }

    func testDefaultRadius() {
        let radius = RadiusInteractableMock()
        XCTAssertTrue(radius.presenter.values == (start: .zero, end: 10))
    }
}
