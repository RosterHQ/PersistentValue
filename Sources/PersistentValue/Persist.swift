//
//  Persist.swift
//  PersistentValue
//
//  Created by Christopher G Prince on 10/25/19.
//

import Foundation

// See https://nshipster.com/propertywrapper/
@propertyWrapper
public struct Persist<Type> {
    private let persisted: PersistentValue<Type>
    
    public init(in storage: PersistentValueStorage, name: String, initialValue: Type? = nil) {
        persisted = try! PersistentValue<Type>(name: name, storage: storage)
        
        if let initialValue = initialValue, persisted.value == nil {
            persisted.value = initialValue
        }
    }

    public var wrappedValue: Type? {
        get { persisted.value }
        set { persisted.value = newValue }
    }
}
