//
//  DataManager.swift
//  Elektra
//
//  Created by Desysnet on 8/25/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation


class DataManager:NSObject {
    static let shared = DataManager()
    
     var products:[Product] = []
    var pantallas:[Product] = []
}
