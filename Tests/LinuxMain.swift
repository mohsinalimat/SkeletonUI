import SnapshotTests
import UITests
import UnitTests
import XCTest

var tests = [XCTestCaseEntry]()
tests += SnapshotTests.allTests()
tests += UnitTests.allTests()
XCTMain(tests)
