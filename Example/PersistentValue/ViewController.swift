//
//  ViewController.swift
//  PersistentValue
//
//  Created by crspybits on 12/05/2018.
//  Copyright (c) 2018 crspybits. All rights reserved.
//

import UIKit
import PersistentValue

class ViewController: UIViewController {
    static let string = try! PersistentValue<String>(name: "My String", storage: .userDefaults)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

