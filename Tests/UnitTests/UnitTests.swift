@testable import SkeletonUI
import SwiftUI
import XCTest

final class UnitTests: XCTestCase {
    func testDefaultAngle() {
        let angle = AngleInteractor()
        angle.presenter.range = 50 ... 100
        XCTAssertTrue(angle.presenter.values == (start: .zero, end: .degrees(50)))
    }

    func testDefaultOpacity() {
        let opacity = OpacityInteractor()
        opacity.presenter.range = 0.5 ... 0.75
        XCTAssertTrue(opacity.presenter.value == 0.5)
    }

    func testDefaultPosition() {
        let position = PositionInteractor()
        position.presenter.range = 0.25 ... 0.75
        XCTAssertTrue(position.presenter.values == (start: UnitPoint(x: -0.75, y: 0.5), end: UnitPoint(x: 1.25, y: 0.5)))
    }

    func testDefaultRadius() {
        let radius = RadiusInteractor()
        radius.presenter.range = 10 ... 30
        XCTAssertTrue(radius.presenter.values == (start: .zero, end: 10))
    }

    func testDefaultMultiline() {
        let multiline = SkeletonInteractor(loading: true).multiline
        XCTAssert(multiline.scale(loading: true, line: 0) == 1)
        XCTAssert(multiline.scale(loading: true, line: 1) == 1)
    }

    func testNoAnimation() {
        var animation = SkeletonInteractor(loading: true).animation
        animation.type = .none
        XCTAssertNil(animation.position.animation)
        XCTAssertNil(animation.opacity.animation)
        XCTAssertNil(animation.radius.animation)
        XCTAssertNil(animation.angle.animation)
    }

    func testDefaultLinearAnimation() {
        var animation = SkeletonInteractor(loading: true).animation
        XCTAssert(animation.type == .linear())
        animation.type = .linear()
        XCTAssertNotNil(animation.position.animation)
        XCTAssertNotNil(animation.opacity.animation)
        XCTAssertNotNil(animation.radius.animation)
        XCTAssertNotNil(animation.angle.animation)
    }

    func testDefaultPulseAnimation() {
        var animation = SkeletonInteractor(loading: true).animation
        animation.type = .pulse()
        XCTAssertNil(animation.position.animation)
        XCTAssertNotNil(animation.opacity.animation)
        XCTAssertNil(animation.radius.animation)
        XCTAssertNil(animation.angle.animation)
    }

    func testDefaultShape() {
        let shape = SkeletonInteractor(loading: true).shape
        XCTAssert(shape.type == .capsule)
    }

    func testDefaultAppearance() {
        let appearance = SkeletonInteractor(loading: true).appearance
        XCTAssert(appearance.type == .gradient())
    }
}
