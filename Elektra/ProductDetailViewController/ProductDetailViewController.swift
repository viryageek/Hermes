//
//  ProductDetailViewController.swift
//  Elektra
//
//  Created by Desysnet on 8/24/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit
import  PINRemoteImage
class ProductDetailViewController: BaseViewController {
    
    var product:Product? {
        didSet {
            if let p = product {
                if p.Images.count > 0 {
                    productImage.pin_setImage(from: URL(string: p.Images[0].ImageUrl))
                }
                priceView.setData(title: "Precio", value: p.randonPrice())
                creditPriceView.setData(title: "Oferta", value: "18 meses sin intereses")
                quantityView.setData(title: "DIsponibles", value: "6")
                
                titleLabel.text = p.ProductName
                descriptionLabel.text = p.ProductDescription
            }
        }
    }
    
    let priceView:SandwichInfoView = {
        let v = SandwichInfoView()
        return v
    }()
 
    let creditPriceView:SandwichInfoView = {
        let v = SandwichInfoView()
        return v
    }()
    
    let quantityView:SandwichInfoView = {
        let v = SandwichInfoView()
        return v
    }()
    
    let titleLabel:UILabel = {
        let v = UILabel()
        v.adjustsFontSizeToFitWidth = true
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.boldSystemFont(ofSize: 35)
        v.textColor = .red
        v.numberOfLines = 2
        return v
    }()
    
    var productImage:UIImageView = {
       let v = UIImageView()
        v.pin_setPlaceholder(with: UIImage(named: "placeholder"))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 300).isActive = true
        v.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return v
    }()
    
    var descriptionLabel:UILabel = {
       let v = UILabel()
        v.numberOfLines = 9
        v.translatesAutoresizingMaskIntoConstraints = false
        v.textColor = UIColor.lightGray
        return v
    }()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        layoutUI()
        configureBarButton()
      
    }


    func setupUI(){
        self.view.addSubview(productImage)
        self.view.addSubview(titleLabel)
        self.view.addSubview(priceView)
        self.view.addSubview(creditPriceView)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(quantityView)
      
    }
    
    func configureBarButton() {
        let doneButton = UIBarButtonItem(title: "Regresar", style: .done, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem = doneButton
        
    }
    
    func layoutUI(){
        productImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        titleLabel.heightAnchor.constraint(equalToConstant: 120).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        titleLabel.topAnchor.constraint(equalTo: productImage.topAnchor, constant: 0).isActive = true
        
        priceView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        priceView.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor, constant: 0).isActive = true
        priceView.heightAnchor.constraint(equalToConstant: 58).isActive = true
        priceView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        creditPriceView.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 16).isActive = true
        creditPriceView.centerXAnchor.constraint(equalTo: priceView.centerXAnchor, constant: 0).isActive = true
        creditPriceView.heightAnchor.constraint(equalToConstant: 58).isActive = true
        creditPriceView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        quantityView.topAnchor.constraint(equalTo: creditPriceView.bottomAnchor, constant: 16).isActive = true
        quantityView.centerXAnchor.constraint(equalTo: priceView.centerXAnchor, constant: 0).isActive = true
        quantityView.heightAnchor.constraint(equalToConstant: 58).isActive = true
        quantityView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant:  8).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor,constant: 8).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
   
    
    
    @objc func close(){
        dismiss(animated: true, completion: nil)
    }
}
