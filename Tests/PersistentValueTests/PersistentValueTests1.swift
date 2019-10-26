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
    
    func testStringTypeFileDeclarationDoesNotThrowError() {
        let _ = try! PersistentValue<String>(name: "testString1", storage: .file)
    }
    
    func testIntTypeFileDeclarationDoesNotThrowError() {
        let _ = try! PersistentValue<Int>(name: "testInt1", storage: .file)
    }
    
    func testBoolTypeUserFileDeclarationDoesNotThrowError() {
        let _ = try! PersistentValue<Bool>(name: "testBool1", storage: .file)
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
    
    func testRetrievingUndefinedUserDefaultsStringGivesNil() {
        let item = try! PersistentValue<String>(name: PersistentValueTests1.testStringNotUsed, storage: .userDefaults)
        XCTAssert(item.value == nil, "\(String(describing: item.value))")
    }
    
    static let testIntNotUsed = "testIntNotUsed"
    static let testIntValueNotUsed = 123
    
    static let testBoolNotUsed = "testBoolNotUsed"
    static let testBoolValueNotUsed = true
    
    func testRetrievingUndefinedUserDefaultsIntGivesNil() {
        let item = try! PersistentValue<Int>(name: PersistentValueTests1.testIntNotUsed, storage: .userDefaults)
        XCTAssert(item.value == nil, "\(String(describing: item.value))")
    }
    
    func testRetrievingUndefinedUserDefaultsBoolGivesNil() {
        let item = try! PersistentValue<Bool>(name: PersistentValueTests1.testBoolNotUsed, storage: .userDefaults)
        XCTAssert(item.value == nil)
    }
    
    func testRetrievingUndefinedKeyChainStringGivesNil() {
        let item = try! PersistentValue<String>(name: PersistentValueTests1.testStringNotUsed, storage: .keyChain)
        XCTAssert(item.value == nil)
    }
    
    func testRetrievingUndefinedKeyChainIntGivesNil() {
        let item = try! PersistentValue<Int>(name: PersistentValueTests1.testIntNotUsed, storage: .keyChain)
        XCTAssert(item.value == nil)
    }
    
    func testRetrievingUndefinedKeyChainBoolGivesNil() {
        let item = try! PersistentValue<Bool>(name: PersistentValueTests1.testBoolNotUsed, storage: .keyChain)
        XCTAssert(item.value == nil)
    }
    
    func testRetrievingUndefinedFileStringGivesNil() {
        let item = try! PersistentValue<String>(name: PersistentValueTests1.testStringNotUsed, storage: .file)
        XCTAssert(item.value == nil)
    }
    
    func testRetrievingUndefinedFileIntGivesNil() {
        let item = try! PersistentValue<Int>(name: PersistentValueTests1.testIntNotUsed, storage: .file)
        XCTAssert(item.value == nil)
    }
    
    func testRetrievingUndefinedFileBoolGivesNil() {
        let item = try! PersistentValue<Bool>(name: PersistentValueTests1.testBoolNotUsed, storage: .file)
        XCTAssert(item.value == nil)
    }
    
    static let testString2 = "testString2"
    static let testStringValue2 = "123"
    
    func testStoringStringUserDefaultsTypeResultsInRetrieval() {
        let item = try! PersistentValue<String>(name: PersistentValueTests1.testString2, storage: .userDefaults)
        item.value = PersistentValueTests1.testStringValue2
        XCTAssert(item.value == PersistentValueTests1.testStringValue2, "Value was: \(String(describing: item.value))")
    }
    
    func testStoringStringKeyChainTypeResultsInRetrieval() {
        let item = try! PersistentValue<String>(name: PersistentValueTests1.testString2, storage: .keyChain)
        item.value = PersistentValueTests1.testStringValue2
        XCTAssert(item.value == PersistentValueTests1.testStringValue2, "Value was: \(String(describing: item.value))")
    }
    
    func testStoringStringFileTypeResultsInRetrieval() {
        let item = try! PersistentValue<String>(name: PersistentValueTests1.testString2, storage: .file)
        item.value = PersistentValueTests1.testStringValue2
        XCTAssert(item.value == PersistentValueTests1.testStringValue2, "Value was: \(String(describing: item.value))")
    }
    
    static let testInt2 = "testInt2"
    static let testIntValue2 = 345
    
    func testStoringIntUserDefaultsTypeResultsInRetrieval() {
        let item = try! PersistentValue<Int>(name: PersistentValueTests1.testInt2, storage: .userDefaults)
        item.value = PersistentValueTests1.testIntValue2
        XCTAssert(item.value == PersistentValueTests1.testIntValue2, "Value was: \(String(describing: item.value))")
    }
    
    func testStoringIntKeyChainTypeResultsInRetrieval() {
        let item = try! PersistentValue<Int>(name: PersistentValueTests1.testInt2, storage: .keyChain)
        item.value = PersistentValueTests1.testIntValue2
        XCTAssert(item.value == PersistentValueTests1.testIntValue2, "Value was: \(String(describing: item.value))")
    }
    
    func testStoringIntFileTypeResultsInRetrieval() {
        let item = try! PersistentValue<Int>(name: PersistentValueTests1.testInt2, storage: .file)
        item.value = PersistentValueTests1.testIntValue2
        XCTAssert(item.value == PersistentValueTests1.testIntValue2, "Value was: \(String(describing: item.value))")
    }
    
    static let testBool2 = "testBool2"
    static let testBoolValue2 = true

    func testStoringBoolUserDefaultsTypeResultsInRetrieval() {
        let item = try! PersistentValue<Bool>(name: PersistentValueTests1.testBool2, storage: .userDefaults)
        item.value = PersistentValueTests1.testBoolValue2
        XCTAssert(item.value == PersistentValueTests1.testBoolValue2, "Value was: \(String(describing: item.value))")
    }
    
    func testStoringBoolKeyChainTypeResultsInRetrieval() {
        let item = try! PersistentValue<Bool>(name: PersistentValueTests1.testBool2, storage: .keyChain)
        item.value = PersistentValueTests1.testBoolValue2
        XCTAssert(item.value == PersistentValueTests1.testBoolValue2, "Value was: \(String(describing: item.value))")
    }
    
    func testStoringBoolFileTypeResultsInRetrieval() {
        let item = try! PersistentValue<Bool>(name: PersistentValueTests1.testBool2, storage: .file)
        item.value = PersistentValueTests1.testBoolValue2
        XCTAssert(item.value == PersistentValueTests1.testBoolValue2, "Value was: \(String(describing: item.value))")
    }
    
    // MARK: Data
    
    func testDataTypeUserDefaultsDeclarationDoesNotThrowError() {
        let _ = try! PersistentValue<Data>(name: "testData1", storage: .userDefaults)
    }
    
    func testDataTypeKeyChainDeclarationDoesNotThrowError() {
        let _ = try! PersistentValue<Data>(name: "testData1", storage: .keyChain)
    }
    
    func testDataTypeFileDeclarationDoesNotThrowError() {
        let _ = try! PersistentValue<Data>(name: "testData1", storage: .file)
    }
    
    func testRetrievingUndefinedUserDefaultsDataGivesNilData() {
        let item = try! PersistentValue<Data>(name: "testData2", storage: .userDefaults)
        XCTAssert(item.value == nil)
    }
    
    func testRetrievingUndefinedKeyChainDataGivesNilData() {
        let item = try! PersistentValue<Data>(name: "testData2", storage: .keyChain)
        XCTAssert(item.value == nil)
    }
    
    func testRetrievingUndefinedFileDataGivesNilData() {
        let item = try! PersistentValue<Data>(name: "testData2", storage: .file)
        XCTAssert(item.value == nil)
    }
    
    static let dataKey3 = "testData3"
    static let dataValue3 = "Foobar".data(using: .utf8)!
    
    func testStoringDataUserDefaultsTypeResultsInRetrieval() {
        let item = try! PersistentValue<Data>(name: PersistentValueTests1.dataKey3, storage: .userDefaults)
        let exampleData = PersistentValueTests1.dataValue3
        item.value = exampleData
        XCTAssert(item.value == exampleData, "Value was: \(String(describing: item.value))")
    }

    static let dataKey4 = "testData4"
    static let dataValue4 = "FoobarXCY".data(using: .utf8)!
    
    func testStoringDataKeyChainTypeResultsInRetrieval() {
        let item = try! PersistentValue<Data>(name: PersistentValueTests1.dataKey4, storage: .keyChain)
        let exampleData = PersistentValueTests1.dataValue4
        item.value = exampleData
        XCTAssert(item.value == exampleData, "Value was: \(String(describing: item.value))")
    }
    
    func testStoringDataFileTypeResultsInRetrieval() {
        let item = try! PersistentValue<Data>(name: PersistentValueTests1.dataKey4, storage: .file)
        let exampleData = PersistentValueTests1.dataValue4
        item.value = exampleData
        XCTAssert(item.value == exampleData, "Value was: \(String(describing: item.value))")
    }
    
    static var allTests = [
        ("testStringTypeUserDefaultsDeclarationDoesNotThrowError", testStringTypeUserDefaultsDeclarationDoesNotThrowError),
        ("testIntTypeUserDefaultsDeclarationDoesNotThrowError", testIntTypeUserDefaultsDeclarationDoesNotThrowError),
        ("testBoolTypeUserDefaultsDeclarationDoesNotThrowError", testBoolTypeUserDefaultsDeclarationDoesNotThrowError),
        ("testStringTypeKeyChainDeclarationDoesNotThrowError", testStringTypeKeyChainDeclarationDoesNotThrowError),
        ("testIntTypeKeyChainDeclarationDoesNotThrowError", testIntTypeKeyChainDeclarationDoesNotThrowError),
        ("testBoolTypeUserKeyChainDeclarationDoesNotThrowError", testBoolTypeUserKeyChainDeclarationDoesNotThrowError),
        ("testStringTypeFileDeclarationDoesNotThrowError", testStringTypeFileDeclarationDoesNotThrowError),
        ("testIntTypeFileDeclarationDoesNotThrowError", testIntTypeFileDeclarationDoesNotThrowError),
        ("testBoolTypeUserFileDeclarationDoesNotThrowError", testBoolTypeUserFileDeclarationDoesNotThrowError),
        ("testUnsupportedTypeDeclarationThrowsError", testUnsupportedTypeDeclarationThrowsError),
        ("testRetrievingUndefinedUserDefaultsStringGivesNil", testRetrievingUndefinedUserDefaultsStringGivesNil),
        ("testRetrievingUndefinedUserDefaultsIntGivesNil", testRetrievingUndefinedUserDefaultsIntGivesNil),
        ("testRetrievingUndefinedUserDefaultsBoolGivesNil", testRetrievingUndefinedUserDefaultsBoolGivesNil),
        ("testRetrievingUndefinedKeyChainStringGivesNil", testRetrievingUndefinedKeyChainStringGivesNil),
        ("testRetrievingUndefinedKeyChainIntGivesNil", testRetrievingUndefinedKeyChainIntGivesNil),
        ("testRetrievingUndefinedKeyChainBoolGivesNil", testRetrievingUndefinedKeyChainBoolGivesNil),
        ("testRetrievingUndefinedFileStringGivesNil", testRetrievingUndefinedFileStringGivesNil),
        ("testRetrievingUndefinedFileIntGivesNil", testRetrievingUndefinedFileIntGivesNil),
        ("testRetrievingUndefinedFileBoolGivesNil", testRetrievingUndefinedFileBoolGivesNil),
        ("testStoringStringUserDefaultsTypeResultsInRetrieval", testStoringStringUserDefaultsTypeResultsInRetrieval),
        ("testStoringStringKeyChainTypeResultsInRetrieval", testStoringStringKeyChainTypeResultsInRetrieval),
        ("testStoringStringFileTypeResultsInRetrieval", testStoringStringFileTypeResultsInRetrieval),
        ("testStoringIntUserDefaultsTypeResultsInRetrieval", testStoringIntUserDefaultsTypeResultsInRetrieval),
        ("testStoringIntKeyChainTypeResultsInRetrieval", testStoringIntKeyChainTypeResultsInRetrieval),
        ("testStoringIntFileTypeResultsInRetrieval", testStoringIntFileTypeResultsInRetrieval),
        ("testStoringBoolUserDefaultsTypeResultsInRetrieval", testStoringBoolUserDefaultsTypeResultsInRetrieval),
        ("testStoringBoolKeyChainTypeResultsInRetrieval", testStoringBoolKeyChainTypeResultsInRetrieval),
        ("testStoringBoolFileTypeResultsInRetrieval", testStoringBoolFileTypeResultsInRetrieval),
        ("testDataTypeUserDefaultsDeclarationDoesNotThrowError", testDataTypeUserDefaultsDeclarationDoesNotThrowError),
        ("testDataTypeKeyChainDeclarationDoesNotThrowError", testDataTypeKeyChainDeclarationDoesNotThrowError),
        ("testDataTypeFileDeclarationDoesNotThrowError", testDataTypeFileDeclarationDoesNotThrowError),
        ("testRetrievingUndefinedUserDefaultsDataGivesNilData", testRetrievingUndefinedUserDefaultsDataGivesNilData),
        ("testRetrievingUndefinedKeyChainDataGivesNilData", testRetrievingUndefinedKeyChainDataGivesNilData),
        ("testRetrievingUndefinedFileDataGivesNilData", testRetrievingUndefinedFileDataGivesNilData),
        ("testStoringDataUserDefaultsTypeResultsInRetrieval", testStoringDataUserDefaultsTypeResultsInRetrieval),
        ("testStoringDataUserDefaultsTypeResultsInRetrieval", testStoringDataUserDefaultsTypeResultsInRetrieval),
        ("testStoringDataKeyChainTypeResultsInRetrieval", testStoringDataKeyChainTypeResultsInRetrieval),
        ("testStoringDataFileTypeResultsInRetrieval", testStoringDataFileTypeResultsInRetrieval)
    ]
}
