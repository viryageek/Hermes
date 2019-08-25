//
//  ClientCell.swift
//  Elektra
//
//  Created by Desysnet on 8/24/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit

class ClientCell:UICollectionViewCell {
    
    var client:Client?  {
        didSet {
            if let cli = client {
                 ageStack.setData(title: "Edad:", value: cli.age)
                finishDateStack.setData(title: "Salida:", value: cli.finishDate)
                startDateStack.setData(title: "Entrada:", value: cli.startDate)
                lastSearchStack.setData(title: "Última consulta:", value:  cli.lastSeach)
                genderStack.setData(title: "Sexo:", value:cli.gender)
                clientNameLabel.text = cli.name
                statusLabel.text = cli.status.title().0
                statusLabel.textColor = cli.status.title().1
                statusCircle.image = cli.status.image()
                
            }
            
        }
    }
    
    var clientNameLabel:UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.boldSystemFont(ofSize: 35)
        v.textAlignment = .center
        v.text = "Luis Enrique"
        return v
    }()
    
    var statusLabel:UILabel = {
       let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "Esperando Ayuda"
        v.textAlignment = .right
        return v
    }()
    
    var statusCircle:UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 30).isActive = true
        v.widthAnchor.constraint(equalToConstant: 30).isActive = true
      v.image = UIImage(named: "esperando")
        return v
    }()
    
    var ageStack:TitleValueStack = {
        let v = TitleValueStack()
        return v
    }()
    
    var genderStack:TitleValueStack = {
        let v = TitleValueStack()
        return v
    }()
    
    var lastSearchStack:TitleValueStack = {
        let v = TitleValueStack()
        return v
    }()
    
    var startDateStack:TitleValueStack = {
        let v = TitleValueStack()
        return v
    }()
    
    var finishDateStack:TitleValueStack = {
        let v = TitleValueStack()
        return v
    }()
    
    var dateStack:UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.distribution = UIStackView.Distribution.fillEqually
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setpUI()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        contentView.backgroundColor = .white
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 10
        contentView.layer.shadowPath = UIBezierPath(rect: contentView.bounds).cgPath
    }
    
    func setpUI(){
        addSubview(clientNameLabel)
      
        addSubview(ageStack)
        addSubview(genderStack)
        addSubview(lastSearchStack)
        addSubview(dateStack)
        dateStack.addArrangedSubview(startDateStack)
        dateStack.addArrangedSubview(finishDateStack)
        addSubview(statusCircle)
        addSubview(statusLabel)
        
    }
    
    func setupLayout(){
        clientNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        clientNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        clientNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        clientNameLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        ageStack.topAnchor.constraint(equalTo: clientNameLabel.bottomAnchor, constant: 16).isActive = true
        ageStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        ageStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        ageStack.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        genderStack.topAnchor.constraint(equalTo: ageStack.bottomAnchor, constant: 16).isActive = true
        genderStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        genderStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        genderStack.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        lastSearchStack.topAnchor.constraint(equalTo: genderStack.bottomAnchor, constant: 16).isActive = true
        lastSearchStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        lastSearchStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        lastSearchStack.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let topSeparator = SeparatorView(direction: .horizontal)
        addSubview(topSeparator)
        topSeparator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        topSeparator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16 ).isActive = true
        topSeparator.topAnchor.constraint(equalTo: lastSearchStack.bottomAnchor, constant: 8).isActive = true
        
        dateStack.topAnchor.constraint(equalTo: topSeparator.bottomAnchor, constant: 8).isActive = true
        dateStack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        dateStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        dateStack.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let botSeparator = SeparatorView(direction: .horizontal)
        addSubview(botSeparator)
        botSeparator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        botSeparator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16 ).isActive = true
        botSeparator.topAnchor.constraint(equalTo: dateStack.bottomAnchor, constant: 8).isActive = true
        
        
        statusCircle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        statusCircle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        statusLabel.centerYAnchor.constraint(equalTo: statusCircle.centerYAnchor).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: statusCircle.leadingAnchor,constant: -8).isActive = true
        
    }
}


enum SeparatorViewDirection {
    case horizontal
    case vertical
}


class SeparatorView:UIView {
    init(direction:SeparatorViewDirection) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        switch direction {
        case .vertical:
            widthAnchor.constraint(equalToConstant: 0.5).isActive = true
        case .horizontal:
            heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        }
        
        backgroundColor = .gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class TitleValueStack:UIStackView {
    
    let titleLabel:UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let valueLabel:UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.textColor = LIGHT_BLUE
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    init() {
        super.init(frame: .zero)
        addArrangedSubview(titleLabel)
        addArrangedSubview(valueLabel)
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fillEqually
        spacing = 16.0
    }
    
    
    func setData(title:String,value:String) {
        
        titleLabel.text = title
        valueLabel.text = value
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
