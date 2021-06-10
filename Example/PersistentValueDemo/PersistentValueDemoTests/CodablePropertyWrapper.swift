//
//  CodablePropertyWrapper.swift
//  PersistentValue_Tests
//
//  Created by Christopher G Prince on 10/26/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
@testable import PersistentValue

// Testing Codable's with @Persist

class CodablePropertyWrapper: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    struct CodableStruct: Equatable, Codable, Persisted {
        let int: Int
        let str: String
    }

    @Persist(in: .userDefaults, name: "persistCodableUserDefaultsWithNoInitialValue")
        var codableUserDefaultsWithNoInitialValue: CodableStruct?
    static let value1 = CodableStruct(int: 3, str: "foo2")
    
    @Persist(in: .userDefaults, name: "persistCodableUserDefaultsWithInitialValue", initialValue: CodablePropertyWrapper.value1)
        var codableUserDefaultsWithInitialValue: CodableStruct?

    func testCodableUserDefaultsIntWithNoInitialValue() {
        let exp = expectation(description: "hack")
        
        // [1]
        XCTAssert(codableUserDefaultsWithNoInitialValue == nil, "\(String(describing: codableUserDefaultsWithNoInitialValue))")
        
        let value = CodableStruct(int: 18, str: "foo")
        codableUserDefaultsWithNoInitialValue = value
        
        XCTAssert(codableUserDefaultsWithNoInitialValue == value)
        codableUserDefaultsWithNoInitialValue = nil
        
        // Hmmm. Without this delay, on a next test, the line at [1] above fails. The assertion isn't met.
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }

    func testCodableUserDefaultsIntWithInitialValue() {
        XCTAssert(codableUserDefaultsWithInitialValue == CodablePropertyWrapper.value1)
        
        let value2 = CodableStruct(int: 3, str: "foo2")
        codableUserDefaultsWithInitialValue = value2
        
        XCTAssert(codableUserDefaultsWithInitialValue == value2)
        codableUserDefaultsWithInitialValue = CodablePropertyWrapper.value1
    }
    
    // MARK: Codable, KeyChain

    @Persist(in: .keyChain, name: "persistCodableKeyChainWithNoInitialValue")
        var codableKeyChainWithNoInitialValue: CodableStruct?

    @Persist(in: .keyChain, name: "persistCodableKeyChainWithInitialValue", initialValue: CodablePropertyWrapper.value1)
        var codableKeyChainWithInitialValue: CodableStruct?
        
    func testCodableKeyChainWithNoInitialValue() {
        XCTAssert(codableKeyChainWithNoInitialValue == nil)
        
        let value = CodableStruct(int: 1, str: "foo")
        codableKeyChainWithNoInitialValue = value
        
        XCTAssert(codableKeyChainWithNoInitialValue == value)
        codableKeyChainWithNoInitialValue = nil
    }
    
    func testCodableKeyChainWithInitialValue() {
        XCTAssert(codableKeyChainWithInitialValue == CodablePropertyWrapper.value1)
        
        let value2 = CodableStruct(int: 3, str: "foo2")
        codableKeyChainWithInitialValue = value2
        
        XCTAssert(codableKeyChainWithInitialValue == value2)
        codableKeyChainWithInitialValue = CodablePropertyWrapper.value1
    }
    
    // MARK: Codable, File

    @Persist(in: .file, name: "persistCodableFileWithNoInitialValue")
        var codableFileWithNoInitialValue: CodableStruct?

    @Persist(in: .file, name: "persistCodableFileWithInitialValue", initialValue: CodablePropertyWrapper.value1)
        var codableFileWithInitialValue: CodableStruct?
        
    func testCodableFileWithNoInitialValue() {
        XCTAssert(codableFileWithNoInitialValue == nil)
        
        let value = CodableStruct(int: 1, str: "foo")
        codableFileWithNoInitialValue = value
        
        XCTAssert(codableFileWithNoInitialValue == value)
        codableFileWithNoInitialValue = nil
    }
    
    func testCodableFileWithInitialValue() {
        XCTAssert(codableFileWithInitialValue == CodablePropertyWrapper.value1)
        
        let value2 = CodableStruct(int: 3, str: "foo2")
        codableFileWithInitialValue = value2
        
        XCTAssert(codableFileWithInitialValue == value2)
        codableFileWithInitialValue = CodablePropertyWrapper.value1
    }
}
