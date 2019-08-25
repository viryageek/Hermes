//
//  SandwichInfoView.swift
//  Elektra
//
//  Created by Desysnet on 8/25/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit


class SandwichInfoView:UIView {
    
    
    let titleLabel:UILabel = {
       let v = UILabel()
        v.backgroundColor = .red
        v.textColor = .white
        v.text = "Última Búsqueda"
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let topView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .red
        return v
    }()
    
    let valueLabel:UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.text = "Televisores"
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        configure()
        setupUI()
        layoutUI()
    }
    
    func setData(title:String,value:String){
        titleLabel.text = title
        valueLabel.text = value
    }
    
    

    
   
    
    func configure(){
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 400, height: 58)).cgPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    
    func setupUI(){
       
        addSubview(valueLabel)
        addSubview(topView)
        topView.addSubview(titleLabel)
    }
    
    func layoutUI(){
        titleLabel.topAnchor.constraint(equalTo: topView.topAnchor,constant: 4).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor,constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        
        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 30).isActive = true
       
        
        valueLabel.topAnchor.constraint(equalTo: topView.bottomAnchor,constant: 4).isActive = true
        valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
