//
//  ProductsOffersDataSource.swift
//  Elektra
//
//  Created by Desysnet on 8/25/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit

class ProductsOffersDataSource:NSObject,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var row = 0
    
    
    weak var delegate:ProductCellDelegate? {
        didSet {
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return Int.random(in: 5 ... 7)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ell", for: indexPath) as! ProductPriceCell
        cell.product = DataManager.shared.pantallas.randomElement()
        cell.delegate = delegate
        return cell
    }
    
    
}
