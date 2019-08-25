//
//  ProductsOfferView.swift
//  Elektra
//
//  Created by Desysnet on 8/25/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit

class ProductsOfferView:UIView {
    
    var direction:UICollectionView.ScrollDirection?

    
    let offersCollectionView:ProductPriceCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let width = (UIScreen.main.bounds.width  / 2 ) - 32
        layout.itemSize = CGSize(width: 150, height: 150  )
        let cv = ProductPriceCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let dataSource = ProductsOffersDataSource()
    
    init(direction:UICollectionView.ScrollDirection) {
        super.init(frame: .zero)
        self.direction = direction
        configure()
        setupUI()
        layoutUI()
        let layout = UICollectionViewFlowLayout()
          layout.itemSize = CGSize(width: 150, height: 150  )
        layout.scrollDirection = direction
        offersCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    
    func setupUI(){
        backgroundColor = UIColor.lightGray
        offersCollectionView.dataSource = dataSource
        addSubview(offersCollectionView)
    }
    
    func layoutUI(){
        offersCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        offersCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        offersCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        offersCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        translatesAutoresizingMaskIntoConstraints = false
      layer.cornerRadius = 10
    }
}
