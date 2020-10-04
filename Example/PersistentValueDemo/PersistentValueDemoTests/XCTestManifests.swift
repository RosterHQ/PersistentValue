import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(PersistentValueTests1.allTests),
        testCase(PersistentValueTests2.allTests),
        testCase(PersistentValueFileTests.allTests)
    ]
}
#endif
