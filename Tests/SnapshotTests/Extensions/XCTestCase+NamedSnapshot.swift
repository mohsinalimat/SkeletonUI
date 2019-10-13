import XCTest
import SnapshotTesting
import SwiftUI

extension XCTestCase {
    var scale: String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: Float(UIScreen.main.scale))
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        guard let scale = formatter.string(from: number) else { fatalError(#function) }
        return scale
    }

    func assertNamedSnapshot<Value, Format>(matching value: @autoclosure () throws -> Value, as snapshotting: SnapshotTesting.Snapshotting<UIViewController, Format>, record recording: Bool = false, timeout: TimeInterval = 5, file: StaticString = #file, testName: String = #function, line: UInt = #line) where Value: View {
        try? ColorScheme.allCases.forEach { scheme in
            let hostingController = try UIHostingController(rootView: value().colorScheme(scheme))
            assertSnapshot(matching: hostingController, as: snapshotting, named: scale + "-" + String(describing: scheme), record: recording, timeout: timeout, file: file, testName: testName, line: line)
        }
    }
}
