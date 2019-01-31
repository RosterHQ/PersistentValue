//
//  PersistentValueTests2.swift
//  roster
//
//  Created by Christopher G Prince on 7/26/17.
//  Copyright © 2017 roster. All rights reserved.
//

import XCTest
@testable import PersistentValue

// This set of tests run after PersistentValueTests1, and can be run sequentially or after an app restart.

class PersistentValueTests2: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testReadingStringUserDefaultsTypeFromPriorRetrieval() {
        let item = try! PersistentValue<String>(name: PersistentValueTests1.testString2, storage: .userDefaults)
        XCTAssert(item.value == PersistentValueTests1.testStringValue2, "Value was: \(String(describing: item.value))")
    }
    
    func testReadingIntUserDefaultsTypeFromPriorRetrieval() {
        let item = try! PersistentValue<Int>(name: PersistentValueTests1.testInt2, storage: .userDefaults)
        XCTAssert(item.value == PersistentValueTests1.testIntValue2, "Value was: \(String(describing: item.value))")
    }
    
    func testReadingStringKeyChainTypeFromPriorRetrieval() {
        let item = try! PersistentValue<String>(name: PersistentValueTests1.testString2, storage: .keyChain)
        XCTAssert(item.value == PersistentValueTests1.testStringValue2, "Value was: \(String(describing: item.value))")
    }
    
    func testReadingIntKeyChainTypeFromPriorRetrieval() {
        let item = try! PersistentValue<Int>(name: PersistentValueTests1.testInt2, storage: .keyChain)
        XCTAssert(item.value == PersistentValueTests1.testIntValue2, "Value was: \(String(describing: item.value))")
    }
    
    func testReadingStringFileTypeFromPriorRetrieval() {
        let item = try! PersistentValue<String>(name: PersistentValueTests1.testString2, storage: .file)
        XCTAssert(item.value == PersistentValueTests1.testStringValue2, "Value was: \(String(describing: item.value))")
    }
    
    func testReadingIntFileTypeFromPriorRetrieval() {
        let item = try! PersistentValue<Int>(name: PersistentValueTests1.testInt2, storage: .file)
        XCTAssert(item.value == PersistentValueTests1.testIntValue2, "Value was: \(String(describing: item.value))")
    }
    
    func testReadingDataUserDefaultsTypeFromPriorRetrieval() {
        let item = try! PersistentValue<Data>(name: PersistentValueTests1.dataKey3, storage: .userDefaults)
        XCTAssert(item.value == PersistentValueTests1.dataValue3, "Value was: \(String(describing: item.value))")
    }
    
    func testReadingDataKeyChainTypeFromPriorRetrieval() {
        let item = try! PersistentValue<Data>(name: PersistentValueTests1.dataKey4, storage: .keyChain)
        XCTAssert(item.value == PersistentValueTests1.dataValue4, "Value was: \(String(describing: item.value))")
    }
    
    func testReadingDataFileTypeFromPriorRetrieval() {
        let item = try! PersistentValue<Data>(name: PersistentValueTests1.dataKey4, storage: .file)
        XCTAssert(item.value == PersistentValueTests1.dataValue4, "Value was: \(String(describing: item.value))")
    }
}
