//
//  DataManager.swift
//  Elektra
//
//  Created by Desysnet on 8/24/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit

class ProducstCollectionViewManager:NSObject,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    weak var delegate:ProductCellDelegate? {
        didSet {
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  Int.random(in: 5 ... 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ell2", for: indexPath) as! ProductDetailCell
        cell.product = DataManager.shared.products.randomElement()
        cell.delegate = delegate
        return cell
    }
    
    
}


class AllProducstCollectionViewManager:NSObject,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    weak var delegate:ProductCellDelegate? {
        didSet {
            
        }
    }
    
    var products = DataManager.shared.pantallas +  DataManager.shared.products
    var filteredProducts:[Product] = []
    var isFiltering = false
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isFiltering ? filteredProducts.count : products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ell2", for: indexPath) as! ProductPriceCell
        cell.product = isFiltering ? filteredProducts[indexPath.row] : products[indexPath.row]
        cell.delegate = delegate
        return cell
    }
    
    
    func filterProductsBy(text:String?){
        guard let text = text else  {return }
        
        if(text.isEmpty){
            isFiltering = false
        } else {
            isFiltering = true
        }
        
        filteredProducts = products.filter {
            return $0.ProductDescription.localizedStandardContains(text) || $0.ProductName.localizedStandardContains(text)
        }
        
        
        
        print(filteredProducts)
        
    }
    
    
}
