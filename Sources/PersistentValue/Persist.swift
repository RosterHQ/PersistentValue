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
    private var basic: PersistentValue<Type>?
    private var codable: AnyObject?
    
    // Got this idea from (https://stackoverflow.com/questions/38213286/overriding-methods-in-swift-extensions)
    // because I was having a lot of problems with extensions.
    private var getter:(() -> Type?)!
    private var setter:((Type?) -> ())!
    
    // I'd like to have access to the String name of the property being wrapped, to use as a default for `name`, but haven't figured out how do that yet: See (https://stackoverflow.com/questions/58575321/access-name-of-object-being-wrapped-in-swift-property-wrapper-implementation)

    public init(in storage: PersistentValueStorage, name: String, initialValue: Type? = nil) {
        basic = try! PersistentValue<Type>(name: name, storage: storage)
        
        if let initialValue = initialValue, basic!.value == nil {
            basic!.value = initialValue
        }
        
        getter = basicGetter
        setter = basicSetter
    }
    
    private func basicGetter() -> Type? {
        if let basic = basic {
            return basic.value
        }
        return nil
    }
    
    private func basicSetter(object: Type?) {
        if let basic = basic {
            basic.value = object
        }
    }

    // This gets used for both basic and codable.
    public var wrappedValue: Type? {
        get {
            return getter()
        }
        
        set {
            setter(newValue)
        }
    }
}

// To use @Persist with Codable's, adopt not only the Codable protocol, but also adopt the Persisted protocol. (I had to use this second protocol because otherwise Int's and others are detected as Codable.)
public protocol Persisted {
}

extension Persist where Type: Codable & Persisted {
    public init(in storage: PersistentValueStorage, name: String, initialValue: Type? = nil) {
        let persistentCodable = PersistentCodableValue<Type>(name: name, storage: storage)
        codable = persistentCodable
        
        if let initialValue = initialValue, persistentCodable.value == nil {
            persistentCodable.value = initialValue
        }
        
        getter = codableGetter
        setter = codableSetter
    }
    
    private func codableGetter() -> Type? {
        if let codable = codable as? PersistentCodableValue<Type> {
            return codable.value
        }
        return nil
    }
    
    private func codableSetter(object: Type?) {
        if let codable = codable as? PersistentCodableValue<Type> {
            codable.value = object
        }
    }
    
    // I would have liked to have just overridden:
    //      public var wrappedValue: Type?
    // but while overidding the init method above works, overriding the property does not. i.e., the overridden property wrappedValue never gets used.
}

