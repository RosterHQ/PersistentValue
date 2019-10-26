import XCTest

import PersistentValueTests

var tests = [XCTestCaseEntry]()
tests += PersistentValueTests1.allTests()
tests += PersistentValueTests2.allTests()
tests += PersistentValueFileTests.allTests()

XCTMain(tests)
