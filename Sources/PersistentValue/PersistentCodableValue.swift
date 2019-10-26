//
//  PersistentCodableValue.swift
//  PersistentValue
//
//  Created by Christopher G Prince on 10/25/19.
//

import SwiftyUserDefaults
import KeychainAccess

public class PersistentCodableValue<T: Codable> {
    private let storage: PersistentValueStorage
    private let name:String
    
    public init(name: String, storage: PersistentValueStorage) {
        self.storage = storage
        self.name = name
    }
    
    public var value:T? {
        set {
            let encodedValue = try? JSONEncoder().encode(newValue)
            
            switch storage {
                case .userDefaults:
                    let key = DefaultsKey<Data?>(name)

                    if newValue == nil {
                        Defaults.remove(key)
                    }
                    else {
                        Defaults[key] = encodedValue
                    }
                
                case .file:
                    /* Need to handle two cases with file setter:
                        1) File doesn't yet exist-- first time a value is set.
                        2) File already exists.
                    */
                    
                    var dict: Dictionary<String, Any>!
                    
                    dict = PersistentValueFile.read()
                    if dict == nil {
                        dict = Dictionary<String, Any>()
                    }
                    
                    if let _ = newValue {
                        dict[name] = encodedValue
                    }
                    else {
                        dict.removeValue(forKey: name)
                    }
                
                    if !PersistentValueFile.write(dictionary: dict) {
                        print("ERROR: Could not write dictionary to file: " + PersistentValueFile.backingFile)
                    }
                
                case .keyChain:
                    let keychain = Keychain(service: keychainService)
                    
                    guard let _ = newValue else {
                        try? keychain.remove(name)
                        return
                    }
                    
                    keychain[data: name] = encodedValue
            }
        }
        
        get {
            let data: Data?
            
            switch storage {
                case .userDefaults:
                    let key = DefaultsKey<Data?>(name)
                    data = Defaults[key]
                
                case .file:
                    guard let dict = PersistentValueFile.read() else {
                        print("ERROR: Could not read dictionary from file: " + PersistentValueFile.backingFile)

                        return nil
                    }
                                        
                    data = dict[name] as? Data
                
                case .keyChain:
                    let keychain = Keychain(service: keychainService)
                    data = keychain[data: name]
            }
            
            if let decoderData = data {
                return try? JSONDecoder().decode(T.self, from: decoderData)
            }
            else {
                return nil
            }
        }
    }
}
