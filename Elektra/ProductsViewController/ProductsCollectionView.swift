//
//  ProductsCollectionView.swift
//  Elektra
//
//  Created by Desysnet on 8/24/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit

class ProductsCollectionView:UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
        register(ProductDetailCell.self, forCellWithReuseIdentifier: "ell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class AllProductsCollectionView:UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
        register(ProductPriceCell.self, forCellWithReuseIdentifier: "ell2")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
