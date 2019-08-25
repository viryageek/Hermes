//
//  Product.swift
//  Elektra
//
//  Created by Desysnet on 8/25/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
struct Product:Codable {
    var ProductId:Int
    var ProductName:String
    var ProductDescription:String
    var BrandName:String
    var Images:[ProductImages]
    
    
    func randonPrice() -> String  {
        let randomDouble = Int.random(in: 1...10000)
        return "De contado: $\(randomDouble)"
    }
    
}

struct ProductImages:Codable {
    var ImageUrl:String
    var ImageName:String
}
