//
//  BaseViewController.swift
//  Elektra
//
//  Created by Desysnet on 8/24/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationbBar()
    }
    
    func setupNavigationbBar() {
        let image: UIImage = UIImage(named: "elektra-logo")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
        navigationController?.navigationBar.isTranslucent = false
        
        definesPresentationContext = true
        
        navigationController?.navigationBar.barTintColor = YELLOW_COLOR
        navigationController?.navigationBar.tintColor = .white
    }
}
