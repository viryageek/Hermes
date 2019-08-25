//
//  ElektraTabBarController.swift
//  Elektra
//
//  Created by Desysnet on 8/24/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit

class ElektraTabBarController:UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tab1 = UINavigationController(rootViewController: ClientsViewController())
        tab1.tabBarItem.title = "Venta"
        tab1.tabBarItem.image = UIImage(named: "bag")
        
        let tab2 = UINavigationController(rootViewController: AllProducstViewController())
        tab2.tabBarItem.title = "Producto"
        tab2.tabBarItem.image = UIImage(named: "gift")
        viewControllers = [tab1,tab2]
    }
    
}
