//
//  PersistentValueFileTests.swift
//  PersistentValue_Tests
//
//  Created by Christopher G Prince on 1/30/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
@testable import PersistentValue

class PersistentValueFileTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReadWritePersistentValueFile() {
        let dict = [
            "a": 1,
            "b": 2
        ]
        XCTAssert(PersistentValueFile.write(dictionary: dict))
        
        guard let dictOut = PersistentValueFile.read() else {
            XCTFail()
            return
        }
        
        XCTAssert(dictOut["a"] as? Int == 1)
        XCTAssert(dictOut["b"] as? Int == 2)
    }
}
