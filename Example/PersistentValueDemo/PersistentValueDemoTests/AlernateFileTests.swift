//
//  AlernateFileTests.swift
//  PersistentValueDemoTests
//
//  Created by Christopher G Prince on 10/3/20.
//

import XCTest
import PersistentValue

class AlternateFileTests: XCTestCase {
    override func setUpWithError() throws {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/" + "Demo"
        try? FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: false, attributes: nil)
        PersistentValueFile.alternativeDocumentsDirectory = path
    }

    override func tearDownWithError() throws {
        PersistentValueFile.alternativeDocumentsDirectory = nil
    }

    func testStoringStringFileTypeResultsInRetrieval() {
        let item = try! PersistentValue<String>(name: PersistentValueTests1.testString2, storage: .file)
        item.value = PersistentValueTests1.testStringValue2
        XCTAssert(item.value == PersistentValueTests1.testStringValue2, "Value was: \(String(describing: item.value))")
    }
    
    @Persist(in: .file, name: "propertyWrapperBoolFileInitialValue2", initialValue: true)
        var fileBoolWithInitialValue: Bool?

    func testFileWithInitialValueBool() {
        XCTAssert(fileBoolWithInitialValue == true)
        fileBoolWithInitialValue = false
        XCTAssert(fileBoolWithInitialValue == false)

        fileBoolWithInitialValue = true
    }
    
    struct CodableStruct: Codable, Equatable {
        let int: Int
        let str: String
    }
    static let value1 = CodableStruct(int: 3, str: "foo2")

    @PersistCodable(in: .keyChain, name: "codableKeyChainWithInitialValue2", initialValue: AlternateFileTests.value1)
        var codableKeyChainWithInitialValue: CodableStruct?
        
    func testCodableKeyChainWithNoInitialValue() {
        XCTAssert(codableKeyChainWithInitialValue == AlternateFileTests.value1)
        
        let value = CodableStruct(int: 1, str: "foo")
        codableKeyChainWithInitialValue = value
        
        XCTAssert(codableKeyChainWithInitialValue == value)
        codableKeyChainWithInitialValue = nil
    }
}
