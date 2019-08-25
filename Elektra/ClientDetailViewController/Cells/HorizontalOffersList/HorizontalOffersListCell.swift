//
//  HorizontalOffersListCell.swift
//  Elektra
//
//  Created by Desysnet on 8/25/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit

class HorizontalOffersListCell:UITableViewCell {
    
    weak var cellDelegate:ProductCellDelegate? {
        didSet {
            historyDataSource.delegate = cellDelegate
            dataSource.delegate = cellDelegate
            offersCollectionView.reloadData()
        }
    }
    
    var title:String? {
        didSet {
            titleLabel.text = title ?? ""
        }
    }
    
    var HistoricalType:HistoricalType? {
        didSet {
            
        }
    }
    
 
    
    var row = 0

    var type:ClientDetailSectionType? {
        didSet {
            if let type = type {
                switch type {
                case .history:
                    offersCollectionView.dataSource = historyDataSource
                case .offer:
                    offersCollectionView.dataSource = dataSource
                }
            }
        }
    }
    
    let titleLabel:UILabel = {
       let v = UILabel()
        v.text = "En oferta!"
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.boldSystemFont(ofSize: 25)
        return v
    }()
    
    let offersCollectionView:ProductPriceCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let width = (UIScreen.main.bounds.width  / 2 ) - 32
        layout.itemSize = CGSize(width: 150, height: 150  )
        let cv = ProductPriceCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let dataSource = ProductsOffersDataSource()
    let historyDataSource = ProducstCollectionViewManager()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        dataSource.row = self.row
        setupUI()
        layoutUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI()  {
        addSubview(titleLabel)
        addSubview(offersCollectionView)
    }
    
    func layoutUI()  {
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        offersCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        offersCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        offersCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        offersCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    }
    
   
}
