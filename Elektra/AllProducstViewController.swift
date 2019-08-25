//
//  ViewController.swift
//  Elektra
//
//  Created by Desysnet on 8/24/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import UIKit

class AllProducstViewController: BaseViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let productsCollectionView:AllProductsCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let width = (UIScreen.main.bounds.width  / 2 ) - 32
        layout.itemSize = CGSize(width: width, height: 300  )
        let cv = AllProductsCollectionView (frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    var dataSource:AllProducstCollectionViewManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavbar()
        setupUI()
        layoutUI()
    }
    
    
    
    func configureNavbar() {
        dataSource = AllProducstCollectionViewManager()
        dataSource?.delegate = self
        productsCollectionView.dataSource = dataSource
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Candies"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        navigationController?.navigationBar.barTintColor = YELLOW_COLOR
        navigationController?.navigationBar.tintColor = .white
    }
    
    func setupUI(){
        productsCollectionView.dataSource = dataSource
        productsCollectionView.delegate = self
        view.addSubview(productsCollectionView)
    }
    
    func layoutUI(){
        productsCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        productsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        productsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        productsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
}

extension AllProducstViewController :UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension AllProducstViewController:ProductCellDelegate {
    
    func didSelect(product: Product) {
        let vc = ProductDetailViewController()
        vc.product = product
        
        
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .formSheet
        present(nc, animated: true, completion: nil)
        //        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}




extension AllProducstViewController: UISearchResultsUpdating {
    public func updateSearchResults(for searchController: UISearchController) {
        self.dataSource?.filterProductsBy(text: searchController.searchBar.text)
       self.productsCollectionView.reloadData()
    }
    
    
}


