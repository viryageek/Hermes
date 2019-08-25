//
//  ClientsOffersCell.swift
//  Elektra
//
//  Created by Desysnet on 8/25/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import  UIKit
class ClientsOffersCell:UITableViewCell {
    
    let offersView:ProductsOfferView = {
        let v = ProductsOfferView(direction: .horizontal)
        return v
    }()

    let shopRangeView:ProductsOfferView = {
        let v = ProductsOfferView(direction: .horizontal)
        return v
    }()
    
    let relatedProductsView:ProductsOfferView = {
      let v = ProductsOfferView(direction: .horizontal)
        return v
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        layoutUI()
        selectionStyle = .none
    }
    
    func configure(){
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        addSubview(offersView)
        addSubview(shopRangeView)
        addSubview(relatedProductsView)
    }
    
    func layoutUI(){
        offersView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        offersView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        offersView.widthAnchor.constraint(equalToConstant: 380).isActive = true
        offersView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        shopRangeView.leadingAnchor.constraint(equalTo: offersView.trailingAnchor, constant: 8).isActive = true
        shopRangeView.heightAnchor.constraint(equalToConstant: (350/2) - 4).isActive = true
        shopRangeView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        shopRangeView.topAnchor.constraint(equalTo: offersView.topAnchor, constant: 0).isActive = true
        
        relatedProductsView.leadingAnchor.constraint(equalTo: offersView.trailingAnchor, constant: 8).isActive = true
        relatedProductsView.heightAnchor.constraint(equalToConstant: (350/2) - 4).isActive = true
        relatedProductsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        relatedProductsView.topAnchor.constraint(equalTo: shopRangeView.bottomAnchor, constant: 8).isActive = true
        
    }
    
    
}
