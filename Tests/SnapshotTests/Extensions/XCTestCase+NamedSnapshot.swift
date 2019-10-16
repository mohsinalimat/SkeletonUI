import SnapshotTesting
import SwiftUI
import XCTest

#if os(macOS)
    typealias ViewController = NSViewController
    typealias HostingController = NSHostingController

    private let factor = NSScreen.main?.backingScaleFactor
#else
    typealias ViewController = UIViewController
    typealias HostingController = UIHostingController

    private let factor = UIScreen.main.scale
#endif

extension XCTestCase {
    private var scale: String {
        let formatter = NumberFormatter()
        #if os(macOS)
            guard let factor = factor else { fatalError(#function) }
        #endif
        let number = NSNumber(value: Float(factor))
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        guard let scale = formatter.string(from: number) else { fatalError(#function) }
        return scale
    }

    private var device: String {
        #if os(macOS)
            var systemInfo = utsname()
            uname(&systemInfo)
            let machineMirror = Mirror(reflecting: systemInfo.machine)
            return machineMirror.children.reduce("") { identifier, element in
                guard let value = element.value as? Int8, value != 0 else { return identifier }
                return identifier + String(UnicodeScalar(UInt8(value)))
            }
        #else
            return UIDevice.current.model
        #endif
    }

    func assertNamedSnapshot<Value, Format>(matching value: @autoclosure () throws -> Value, as snapshotting: SnapshotTesting.Snapshotting<ViewController, Format>, size: CGSize, record recording: Bool = false, timeout: TimeInterval = 5, file: StaticString = #file, testName: String = #function, line: UInt = #line) where Value: View {
        try? ColorScheme.allCases.forEach { scheme in
            let view = try value().colorScheme(scheme).frame(width: size.width, height: size.height)
            let hostingController = HostingController(rootView: view)
            let name = "\(device)-\(scale)-\(scheme)"
            #if os(macOS)
                hostingController.view.layer?.backgroundColor = .clear
                hostingController.view.frame.size = size
            #else
                hostingController.view.backgroundColor = .clear
            #endif
            assertSnapshot(matching: hostingController, as: snapshotting, named: name, record: recording, timeout: timeout, file: file, testName: testName, line: line)
        }
    }
}
