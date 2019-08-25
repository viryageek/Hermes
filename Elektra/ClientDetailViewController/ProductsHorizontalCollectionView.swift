//
//  ProductsHorizontalCollectionView.swift
//  Elektra
//
//  Created by Desysnet on 8/25/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit

class ProductsHorizontalCollectionView:UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
        register(ProductDetailCell.self, forCellWithReuseIdentifier: "ell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
