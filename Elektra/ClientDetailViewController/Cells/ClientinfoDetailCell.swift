//
//  ClientinfoDetailCell.swift
//  Elektra
//
//  Created by Desysnet on 8/25/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit

class ClientinfoDetailCell:UITableViewCell {
    
    let lastSearchView:SandwichInfoView = {
       let v = SandwichInfoView()
        v.setData(title: "Última búsqueda", value: "Televisores")
        return v
    }()
    
    let availableCreditView:SandwichInfoView = {
        let v = SandwichInfoView()
        v.setData(title: "Crédito disponible", value: "$15,000")
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
        addSubview(lastSearchView)
        addSubview(availableCreditView)
    }
    
    func layoutUI(){
        lastSearchView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        lastSearchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        lastSearchView.heightAnchor.constraint(equalToConstant: 58).isActive = true
        lastSearchView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        availableCreditView.topAnchor.constraint(equalTo: lastSearchView.topAnchor, constant: 0).isActive = true
        availableCreditView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        availableCreditView.heightAnchor.constraint(equalToConstant: 58).isActive = true
        availableCreditView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
    }
}
