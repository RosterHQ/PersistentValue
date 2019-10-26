//
//  PersistCodable.swift
//  PersistentValue
//
//  Created by Christopher G Prince on 10/25/19.
//

@propertyWrapper
public struct PersistCodable<Type: Codable> {
    private let persisted: PersistentCodableValue<Type>
    
    public init(in storage: PersistentValueStorage, name: String, initialValue: Type? = nil) {
        persisted = PersistentCodableValue<Type>(name: name, storage: storage)
        
        if let initialValue = initialValue, persisted.value == nil {
            persisted.value = initialValue
        }
    }

    public var wrappedValue: Type? {
        get { return persisted.value }
        set { persisted.value = newValue }
    }
}
