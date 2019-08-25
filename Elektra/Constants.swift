//
//  Constants.swift
//  Elektra
//
//  Created by Desysnet on 8/24/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit

let YELLOW_COLOR = UIColor(red: 255/255, green: 220/255, blue: 32/255, alpha: 1)
let LIGHT_BLUE =  UIColor(red: 33/255, green: 182/255, blue: 247/255, alpha: 1)


struct Client {
    var name:String
    var age:String
    var gender:String
    var lastSeach:String
    var startDate:String
    var finishDate:String
    var status:ClientStatus
}


enum ClientStatus {
    case waiting
    case closed
    case attended
    case nohelp
    
    func image() -> UIImage? {
        switch self {
        case .attended:
            return UIImage(named: "atendido")
        case .closed:
            return UIImage(named: "salio")
        case .waiting:
            return UIImage(named: "esperando")
        case .nohelp:
            return UIImage(named: "rechazada")
        }
    }
    
    func title() -> (String,UIColor) {
        switch self {
        case .attended:
            return ("El cliente está siendo atendido",UIColor(red: 126/255, green: 211/255, blue: 33/255, alpha: 1))
        case .closed:
           return ("El cliente ya cerró su sesión",UIColor.gray)
        case .waiting:
           return ("El cliente está esperando por tu ayuda",UIColor.red)
        case .nohelp:
           return ("El cliente no pidió ayuda",UIColor.orange)
        }
    }
}


let clients = [
    Client(name: "Luis Enrique", age: "26", gender: "Hombre", lastSeach: "Nintendo", startDate: "19:20", finishDate: "19:45", status: .waiting),
    Client(name: "Jaqueline Bautista ", age: "26", gender: "Mujer", lastSeach: "Television", startDate: "18:35", finishDate: "19:00", status: .attended),
    Client(name: "Aremi Reyes", age: "32'", gender: "Mujer", lastSeach: "Macbook", startDate: "13:40", finishDate: "14:10", status: .closed),
    Client(name: "Juan Angel", age: "20'", gender: "Hombre", lastSeach: "Lavadora 14 kg", startDate: "13:40", finishDate: "14:10", status: .nohelp)]
