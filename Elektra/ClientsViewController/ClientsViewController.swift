//
//  ClientsViewController.swift
//  Elektra
//
//  Created by Desysnet on 8/24/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit

class ClientsViewController:BaseViewController {
    
    let clientsCollectionView:ClientsCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let width = (UIScreen.main.bounds.width  / 2 ) - 32
        layout.itemSize = CGSize(width: width, height: 250  )
        let cv = ClientsCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    var dataSource = ClientsDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        layoutUI()
    }
    
    
    func setupUI(){
        dataSource = ClientsDataSource()
        clientsCollectionView.dataSource = dataSource
        clientsCollectionView.delegate = self
        view.addSubview(clientsCollectionView)
    }
    
    func layoutUI(){
        clientsCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        clientsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        clientsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        clientsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}



extension ClientsViewController :UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let vc = ClientDetailsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
