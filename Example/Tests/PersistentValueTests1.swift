//
//  PersistentValueTests1.swift
//  roster
//
//  Created by Christopher G Prince on 7/26/17.
//  Copyright © 2017 roster. All rights reserved.
//

import XCTest
@testable import PersistentValue

class PersistentValueTests1: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStringTypeUserDefaultsDeclarationDoesNotThrowError() {
        let _ = try! PersistentValue<String>(name: "testString1", storage: .userDefaults)
    }
    
    func testIntTypeUserDefaultsDeclarationDoesNotThrowError() {
        let _ = try! PersistentValue<Int>(name: "testInt1", storage: .userDefaults)
    }
    
    func testBoolTypeUserDefaultsDeclarationDoesNotThrowError() {
        let _ = try! PersistentValue<Bool>(name: "testBool1", storage: .userDefaults)
    }
    
    func testStringTypeKeyChainDeclarationDoesNotThrowError() {
        let _ = try! PersistentValue<String>(name: "testString1", storage: .keyChain)
    }
    
    func testIntTypeKeyChainDeclarationDoesNotThrowError() {
        let _ = try! PersistentValue<Int>(name: "testInt1", storage: .keyChain)
    }
    
    func testBoolTypeUserKeyChainDeclarationDoesNotThrowError() {
        let _ = try! PersistentValue<Bool>(name: "testBool1", storage: .keyChain)
    }
    
    // We may support this later, but for now a Double is unsupported.
    func testUnsupportedTypeDeclarationThrowsError() {
        var threwError = false
        do {
            let _ = try PersistentValue<Double>(name: "testDouble1", storage: .userDefaults)
        } catch {
            threwError = true
        }
        XCTAssert(threwError)
    }
    
    static let testStringNotUsed = "testStringNotUsed"
    static let testStringValueNotUsed = "123"
    
    func testRetrievingUndefinedUserDefaultsStringGivesBlank() {
        let item = try! PersistentValue<String>(name: PersistentValueTests1.testStringNotUsed, storage: .userDefaults)
        XCTAssert(item.value == "")
    }
    
    static let testIntNotUsed = "testIntNotUsed"
    static let testIntValueNotUsed = 123
    
    static let testBoolNotUsed = "testBoolNotUsed"
    static let testBoolValueNotUsed = true
    
    func testRetrievingUndefinedUserDefaultsIntGivesZero() {
        let item = try! PersistentValue<Int>(name: PersistentValueTests1.testIntNotUsed, storage: .userDefaults)
        XCTAssert(item.value == 0)
    }
    
    func testRetrievingUndefinedUserDefaultsBoolGivesFalse() {
        let item = try! PersistentValue<Bool>(name: PersistentValueTests1.testBoolNotUsed, storage: .userDefaults)
        XCTAssert(item.value == false)
    }
    
    func testRetrievingUndefinedKeyChainStringGivesBlank() {
        let item = try! PersistentValue<String>(name: PersistentValueTests1.testStringNotUsed, storage: .keyChain)
        XCTAssert(item.value == "")
    }
    
    func testRetrievingUndefinedKeyChainIntGivesZero() {
        let item = try! PersistentValue<Int>(name: PersistentValueTests1.testIntNotUsed, storage: .keyChain)
        XCTAssert(item.value == 0)
    }
    
    func testRetrievingUndefinedKeyChainBoolGivesFalse() {
        let item = try! PersistentValue<Bool>(name: PersistentValueTests1.testBoolNotUsed, storage: .keyChain)
        XCTAssert(item.value == false)
    }
    
    static let testString2 = "testString2"
    static let testStringValue2 = "123"
    
    func testStoringStringUserDefaultsTypeResultsInRetrieval() {
        let item = try! PersistentValue<String>(name: PersistentValueTests1.testString2, storage: .userDefaults)
        item.value = PersistentValueTests1.testStringValue2
        XCTAssert(item.value == PersistentValueTests1.testStringValue2, "Value was: \(item.value)")
    }
    
    func testStoringStringKeyChainTypeResultsInRetrieval() {
        let item = try! PersistentValue<String>(name: PersistentValueTests1.testString2, storage: .keyChain)
        item.value = PersistentValueTests1.testStringValue2
        XCTAssert(item.value == PersistentValueTests1.testStringValue2, "Value was: \(item.value)")
    }
    
    static let testInt2 = "testInt2"
    static let testIntValue2 = 345
    
    func testStoringIntUserDefaultsTypeResultsInRetrieval() {
        let item = try! PersistentValue<Int>(name: PersistentValueTests1.testInt2, storage: .userDefaults)
        item.value = PersistentValueTests1.testIntValue2
        XCTAssert(item.value == PersistentValueTests1.testIntValue2, "Value was: \(item.value)")
    }
    
    func testStoringIntKeyChainTypeResultsInRetrieval() {
        let item = try! PersistentValue<Int>(name: PersistentValueTests1.testInt2, storage: .keyChain)
        item.value = PersistentValueTests1.testIntValue2
        XCTAssert(item.value == PersistentValueTests1.testIntValue2, "Value was: \(item.value)")
    }
    
    static let testBool2 = "testBool2"
    static let testBoolValue2 = true

    func testStoringBoolUserDefaultsTypeResultsInRetrieval() {
        let item = try! PersistentValue<Bool>(name: PersistentValueTests1.testBool2, storage: .userDefaults)
        item.value = PersistentValueTests1.testBoolValue2
        XCTAssert(item.value == PersistentValueTests1.testBoolValue2, "Value was: \(item.value)")
    }
    
    func testStoringBoolKeyChainTypeResultsInRetrieval() {
        let item = try! PersistentValue<Bool>(name: PersistentValueTests1.testBool2, storage: .keyChain)
        item.value = PersistentValueTests1.testBoolValue2
        XCTAssert(item.value == PersistentValueTests1.testBoolValue2, "Value was: \(item.value)")
    }
    
    // MARK: Data
    
    func testDataTypeUserDefaultsDeclarationDoesNotThrowError() {
        let _ = try! PersistentValue<Data>(name: "testData1", storage: .userDefaults)
    }
    
    func testDataTypeKeyChainDeclarationDoesNotThrowError() {
        let _ = try! PersistentValue<Data>(name: "testData1", storage: .keyChain)
    }
    
    func testRetrievingUndefinedUserDefaultsDataGivesEmptyData() {
        let item = try! PersistentValue<Data>(name: "testData2", storage: .userDefaults)
        XCTAssert(item.value == Data())
        XCTAssert(item.value.count == 0)
    }
    
    func testRetrievingUndefinedKeyChainDataGivesEmptyData() {
        let item = try! PersistentValue<Data>(name: "testData2", storage: .keyChain)
        XCTAssert(item.value == Data())
        XCTAssert(item.value.count == 0)
    }
    
    static let dataKey3 = "testData3"
    static let dataValue3 = "Foobar".data(using: .utf8)!
    
    func testStoringDataUserDefaultsTypeResultsInRetrieval() {
        let item = try! PersistentValue<Data>(name: PersistentValueTests1.dataKey3, storage: .userDefaults)
        let exampleData = PersistentValueTests1.dataValue3
        item.value = exampleData
        XCTAssert(item.value == exampleData, "Value was: \(item.value)")
    }

    static let dataKey4 = "testData4"
    static let dataValue4 = "FoobarXCY".data(using: .utf8)!
    
    func testStoringDataKeyChainTypeResultsInRetrieval() {
        let item = try! PersistentValue<Data>(name: PersistentValueTests1.dataKey4, storage: .keyChain)
        let exampleData = PersistentValueTests1.dataValue4
        item.value = exampleData
        XCTAssert(item.value == exampleData, "Value was: \(item.value)")
    }
    
}
