import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(SnapshotTests.allTests)
        ]
    }
#endif
