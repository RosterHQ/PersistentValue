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
        let initialValue = PersistentValueFile.read()
        
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
        
        // Return the file to its original state to not mess up other tests.
        if initialValue != nil {
            XCTAssert(PersistentValueFile.write(dictionary: initialValue!))
        }
    }
    
    static var allTests = [
        ("testReadWritePersistentValueFile", testReadWritePersistentValueFile),
    ]
}


