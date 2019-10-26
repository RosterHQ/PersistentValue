//
//  PropertyWrapper.swift
//  PersistentValue_Tests
//
//  Created by Christopher G Prince on 10/25/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import PersistentValue

class PropertyWrapper: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    @Persist(in: .userDefaults, name: "propertyWrapperIntUserDefaultsInitialValue", initialValue: 1)
        var userDefaultsIntWithInitialValue: Int
    @Persist(in: .userDefaults, name: "propertyWrapperIntUserDefaultsWithNoInitialValue")
        var userDefaultsIntWithNoInitialValue: Int?

    func testUserDefaultsWithInitialValueInt() {
        XCTAssert(userDefaultsIntWithInitialValue == 1)
        userDefaultsIntWithInitialValue = 2
        XCTAssert(userDefaultsIntWithInitialValue == 2)

        userDefaultsIntWithInitialValue = 1
    }

    func testUserDefaultsWithNoInitialValueInt() {
        XCTAssert(userDefaultsIntWithNoInitialValue == nil)
        userDefaultsIntWithNoInitialValue = 2
        XCTAssert(userDefaultsIntWithNoInitialValue == 2)

        userDefaultsIntWithNoInitialValue = nil
    }

    @Persist(in: .userDefaults, name: "propertyWrapperStringUserDefaultsInitialValue", initialValue: "foo")
        var userDefaultsStringWithInitialValue: String
    @Persist(in: .userDefaults, name: "propertyWrapperStringUserDefaultsWithNoInitialValue")
        var userDefaultsStringWithNoInitialValue: String?

    func testUserDefaultsWithNoInitialValueString() {
        XCTAssert(userDefaultsStringWithNoInitialValue == nil)
        userDefaultsStringWithNoInitialValue = "other"
        XCTAssert(userDefaultsStringWithNoInitialValue == "other")

        userDefaultsStringWithNoInitialValue = nil
    }

    func testUserDefaultsWithInitialValueString() {
        XCTAssert(userDefaultsStringWithInitialValue == "foo")
        userDefaultsStringWithInitialValue = "other2"
        XCTAssert(userDefaultsStringWithInitialValue == "other2")

        userDefaultsStringWithInitialValue = "foo"
    }

    @Persist(in: .userDefaults, name: "propertyWrapperBoolUserDefaultsInitialValue", initialValue: true)
        var userDefaultsBoolWithInitialValue: Bool
    @Persist(in: .userDefaults, name: "propertyWrapperBoolUserDefaultsWithNoInitialValue")
        var userDefaultsBoolWithNoInitialValue: Bool?

    func testUserDefaultsWithInitialValueBool() {
        XCTAssert(userDefaultsBoolWithInitialValue == true)
        userDefaultsBoolWithInitialValue = false
        XCTAssert(userDefaultsBoolWithInitialValue == false)

        userDefaultsBoolWithInitialValue = true
    }

    func testUserDefaultsWithNoInitialValueBool() {
        XCTAssert(userDefaultsBoolWithNoInitialValue == nil)
        userDefaultsBoolWithNoInitialValue = false
        XCTAssert(userDefaultsBoolWithNoInitialValue == false)

        userDefaultsBoolWithNoInitialValue = nil
    }

    @Persist(in: .userDefaults, name: "propertyWrapperDataUserDefaultsInitialValue", initialValue: Data())
        var userDefaultsDataWithInitialValue: Data
    @Persist(in: .userDefaults, name: "propertyWrapperDataUserDefaultsWithNoInitialValue")
        var userDefaultsDataWithNoInitialValue: Data?

    func testUserDefaultsWithInitialValueData() {
        XCTAssert(userDefaultsDataWithInitialValue == Data())
        userDefaultsDataWithInitialValue = "foo".data(using: .utf8)
        XCTAssert(userDefaultsDataWithInitialValue == "foo".data(using: .utf8))

        userDefaultsDataWithInitialValue = Data()
    }

    func testUserDefaultsWithNoInitialValueData() {
        XCTAssert(userDefaultsDataWithNoInitialValue == nil)
        userDefaultsDataWithNoInitialValue = "foo".data(using: .utf8)
        XCTAssert(userDefaultsDataWithNoInitialValue == "foo".data(using: .utf8))

        userDefaultsDataWithNoInitialValue = nil
    }

    // MARK: KeyChain

    @Persist(in: .keyChain, name: "propertyWrapperIntKeyChainInitialValue", initialValue: 1)
        var keyChainIntWithInitialValue: Int
    @Persist(in: .keyChain, name: "propertyWrapperIntKeyChainWithNoInitialValue")
        var keyChainIntWithNoInitialValue: Int?

    func testKeyChainWithInitialValueInt() {
        XCTAssert(keyChainIntWithInitialValue == 1)
        keyChainIntWithInitialValue = 2
        XCTAssert(keyChainIntWithInitialValue == 2)

        keyChainIntWithInitialValue = 1
    }

    func testKeyChainWithNoInitialValueInt() {
        XCTAssert(keyChainIntWithNoInitialValue == nil)
        keyChainIntWithNoInitialValue = 2
        XCTAssert(keyChainIntWithNoInitialValue == 2)

        keyChainIntWithNoInitialValue = nil
    }

    @Persist(in: .keyChain, name: "propertyWrapperStringKeyChainInitialValue", initialValue: "foo")
        var keyChainStringWithInitialValue: String
    @Persist(in: .keyChain, name: "propertyWrapperStringKeyChainWithNoInitialValue")
        var keyChainStringWithNoInitialValue: String?

    func testKeyChainWithNoInitialValueString() {
        XCTAssert(keyChainStringWithNoInitialValue == nil)
        keyChainStringWithNoInitialValue = "other"
        XCTAssert(keyChainStringWithNoInitialValue == "other")

        keyChainStringWithNoInitialValue = nil
    }

    func testKeyChainWithInitialValueString() {
        XCTAssert(keyChainStringWithInitialValue == "foo")
        keyChainStringWithInitialValue = "other2"
        XCTAssert(keyChainStringWithInitialValue == "other2")

        keyChainStringWithInitialValue = "foo"
    }

    @Persist(in: .keyChain, name: "propertyWrapperBoolKeyChainInitialValue", initialValue: true)
        var keyChainBoolWithInitialValue: Bool
    @Persist(in: .keyChain, name: "propertyWrapperBoolKeyChainWithNoInitialValue")
        var keyChainBoolWithNoInitialValue: Bool?

    func testKeyChainWithInitialValueBool() {
        XCTAssert(keyChainBoolWithInitialValue == true)
        keyChainBoolWithInitialValue = false
        XCTAssert(keyChainBoolWithInitialValue == false)

        keyChainBoolWithInitialValue = true
    }

    func testKeyChainWithNoInitialValueBool() {
        XCTAssert(keyChainBoolWithNoInitialValue == nil)
        keyChainBoolWithNoInitialValue = false
        XCTAssert(keyChainBoolWithNoInitialValue == false)

        keyChainBoolWithNoInitialValue = nil
    }

    @Persist(in: .keyChain, name: "propertyWrapperDataKeyChainInitialValue", initialValue: Data())
        var keyChainDataWithInitialValue: Data
    @Persist(in: .keyChain, name: "propertyWrapperDataKeyChainWithNoInitialValue")
        var keyChainDataWithNoInitialValue: Data?

    func testKeyChainWithInitialValueData() {
        XCTAssert(keyChainDataWithInitialValue == Data())
        keyChainDataWithInitialValue = "foo".data(using: .utf8)
        XCTAssert(keyChainDataWithInitialValue == "foo".data(using: .utf8))

        keyChainDataWithInitialValue = Data()
    }

    func testKeyChainWithNoInitialValueData() {
        XCTAssert(keyChainDataWithNoInitialValue == nil)
        keyChainDataWithNoInitialValue = "foo".data(using: .utf8)
        XCTAssert(keyChainDataWithNoInitialValue == "foo".data(using: .utf8))

        keyChainDataWithNoInitialValue = nil
    }
    
    // MARK: File
    
    @Persist(in: .file, name: "propertyWrapperIntFileInitialValue", initialValue: 1)
        var fileIntWithInitialValue: Int
    @Persist(in: .file, name: "propertyWrapperIntFileWithNoInitialValue")
        var fileIntWithNoInitialValue: Int?

    func testFileWithInitialValueInt() {
        XCTAssert(fileIntWithInitialValue == 1, "\(String(describing: fileIntWithInitialValue))")
        fileIntWithInitialValue = 2
        XCTAssert(fileIntWithInitialValue == 2)

        fileIntWithInitialValue = 1
    }
    
    func testFileWithNoInitialValueInt() {
        XCTAssert(fileIntWithNoInitialValue == nil)
        fileIntWithNoInitialValue = 2
        XCTAssert(fileIntWithNoInitialValue == 2)

        fileIntWithNoInitialValue = nil
    }

    @Persist(in: .file, name: "propertyWrapperStringFileInitialValue", initialValue: "foo")
        var fileStringWithInitialValue: String
    @Persist(in: .file, name: "propertyWrapperStringFileWithNoInitialValue")
        var fileStringWithNoInitialValue: String?

    func testFileWithNoInitialValueString() {
        XCTAssert(fileStringWithNoInitialValue == nil)
        fileStringWithNoInitialValue = "other"
        XCTAssert(fileStringWithNoInitialValue == "other")

        fileStringWithNoInitialValue = nil
    }

    func testFileWithInitialValueString() {
        XCTAssert(fileStringWithInitialValue == "foo", "\(String(describing: fileStringWithInitialValue))")
        fileStringWithInitialValue = "other2"
        XCTAssert(fileStringWithInitialValue == "other2")

        fileStringWithInitialValue = "foo"
    }

    @Persist(in: .keyChain, name: "propertyWrapperBoolFileInitialValue", initialValue: true)
        var fileBoolWithInitialValue: Bool
    @Persist(in: .keyChain, name: "propertyWrapperBoolFileWithNoInitialValue")
        var fileBoolWithNoInitialValue: Bool

    func testFileWithInitialValueBool() {
        XCTAssert(fileBoolWithInitialValue == true)
        fileBoolWithInitialValue = false
        XCTAssert(fileBoolWithInitialValue == false)

        fileBoolWithInitialValue = true
    }

    func testFileWithNoInitialValueBool() {
        XCTAssert(fileBoolWithNoInitialValue == nil)
        fileBoolWithNoInitialValue = false
        XCTAssert(fileBoolWithNoInitialValue == false)

        fileBoolWithNoInitialValue = nil
    }

    @Persist(in: .file, name: "propertyWrapperDataFileInitialValue", initialValue: Data())
        var fileDataWithInitialValue: Data
    @Persist(in: .file, name: "propertyWrapperDataFileWithNoInitialValue")
        var fileDataWithNoInitialValue: Data?

    func testFileWithInitialValueData() {
        XCTAssert(fileDataWithInitialValue == Data(), "\(String(describing: fileDataWithInitialValue))")
        fileDataWithInitialValue = "foo".data(using: .utf8)
        XCTAssert(fileDataWithInitialValue == "foo".data(using: .utf8))

        fileDataWithInitialValue = Data()
    }

    func testFileWithNoInitialValueData() {
        XCTAssert(fileDataWithNoInitialValue == nil)
        fileDataWithNoInitialValue = "foo".data(using: .utf8)
        XCTAssert(fileDataWithNoInitialValue == "foo".data(using: .utf8))

        fileDataWithNoInitialValue = nil
    }
}
