//
//  ProductPriceCell.swift
//  Elektra
//
//  Created by Desysnet on 8/25/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit

class ProductPriceCell:UICollectionViewCell {
    
    let productImage:UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = UIImageView.ContentMode.scaleAspectFit
        return v
    }()
    
    weak var delegate:ProductCellDelegate?
    
    var product:Product? {
        didSet {
            if let p = self.product {
                infoView.nameLabel.text = p.ProductName
                infoView.dateLabel.text = p.randonPrice()
                if p.Images.count > 0 {
                    productImage.pin_setImage(from: URL(string: p.Images[0].ImageUrl))
                    
                }
                
            }
        }
    }
    
    let infoView:ProductPriceCellInfo = {
        let v = ProductPriceCellInfo()
        return v
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setpUI()
        setupLayout()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didUserSelect))
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didUserSelect(){
        delegate?.didSelect(product: product!)
    }
    
    func configure(){
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(rect: contentView.bounds).cgPath
    }
    
    func setpUI(){
        contentView.addSubview(productImage)
        contentView.addSubview(infoView)
    }
    
    func setupLayout(){
        productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        productImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.65).isActive = true
        productImage.clipsToBounds = true
        
        infoView.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 0).isActive = true
        infoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        infoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        infoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
}


class ProductPriceCellInfo:UIView {
    
    let nameLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .gray
        l.numberOfLines = 2
        l.font = UIFont.systemFont(ofSize: 14)
        l.adjustsFontSizeToFitWidth = true
        l.text = "Juego de Sábanas King Size Spring Air Verde Olivo 4 pzs"
        return l
    }()
    
    let dateLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .red
        l.font = UIFont.systemFont(ofSize: 14)
        l.adjustsFontSizeToFitWidth = true
        l.text = "De contado: 5,300"
        return l
    }()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        setpUI()
        setupLayout()
    }
    
    
    func setpUI() {
        addSubview(nameLabel)
        addSubview(dateLabel)
    }
    
    func setupLayout() {
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.40).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
        dateLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.40).isActive = true
        
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
