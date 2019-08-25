//
//  ClientHIstoryProductsCell.swift
//  Elektra
//
//  Created by Desysnet on 8/25/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import UIKit
import Foundation

class ClientHIstoryProductsCell:UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        layoutUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var lastSearchDataSource = LastSearchDataSource()
    
    var lastSearchTitleLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Últimas búsquedas"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 25)
        return lbl
    }()
    
    var lastBoughtTitleLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Últimas compras"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 25)
        return lbl
    }()
    
    var lastVisitedTitleLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Últimas visitas a producto"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 25)
        return lbl
    }()
    
    var lastSearchProducstCollectionView:ProductsHorizontalCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let width = (UIScreen.main.bounds.width  / 2 ) - 32
        layout.itemSize = CGSize(width: 220, height: 141  )
        let cv = ProductsHorizontalCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    var lastBoughtProducstCollectionView:ProductsHorizontalCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let width = (UIScreen.main.bounds.width  / 2 ) - 32
        layout.itemSize = CGSize(width: 220, height: 161  )
        let cv = ProductsHorizontalCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    
    var lastVisitedProducstCollectionView:ProductsHorizontalCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let width = (UIScreen.main.bounds.width  / 2 ) - 32
        layout.itemSize = CGSize(width: 220, height: 161  )
        let cv = ProductsHorizontalCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()

    
    
    
    func setupUI(){
        lastSearchProducstCollectionView.dataSource = lastSearchDataSource
        addSubview(lastSearchProducstCollectionView)
        lastBoughtProducstCollectionView.dataSource = lastSearchDataSource
        addSubview(lastBoughtProducstCollectionView)
        lastVisitedProducstCollectionView.dataSource = lastSearchDataSource
        addSubview(lastVisitedProducstCollectionView)
        addSubview(lastSearchTitleLabel)
        addSubview(lastBoughtTitleLabel)
        addSubview(lastVisitedTitleLabel)
    }
    
    func layoutUI(){
        
        lastSearchTitleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        lastSearchTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16).isActive = true
        lastSearchTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lastSearchTitleLabel.topAnchor.constraint(equalTo: topAnchor,constant: 16).isActive = true
        
        lastSearchProducstCollectionView.topAnchor.constraint(equalTo: lastSearchTitleLabel.bottomAnchor, constant: 8).isActive = true
        lastSearchProducstCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        lastSearchProducstCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        lastSearchProducstCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        lastBoughtTitleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        lastBoughtTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16).isActive = true
        lastBoughtTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lastBoughtTitleLabel.topAnchor.constraint(equalTo: lastSearchProducstCollectionView.bottomAnchor,constant: 16).isActive = true
        
        lastBoughtProducstCollectionView.topAnchor.constraint(equalTo: lastBoughtTitleLabel.bottomAnchor, constant: 8).isActive = true
        lastBoughtProducstCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        lastBoughtProducstCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        lastBoughtProducstCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        lastVisitedTitleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        lastVisitedTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16).isActive = true
        lastVisitedTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lastVisitedTitleLabel.topAnchor.constraint(equalTo: lastBoughtProducstCollectionView.bottomAnchor,constant: 16).isActive = true
        
        lastVisitedProducstCollectionView.topAnchor.constraint(equalTo: lastVisitedTitleLabel.bottomAnchor, constant: 8).isActive = true
        lastVisitedProducstCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        lastVisitedProducstCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        lastVisitedProducstCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
