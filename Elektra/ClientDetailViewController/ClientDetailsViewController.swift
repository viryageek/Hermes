//
//  ClientDetailsViewController.swift
//  Elektra
//
//  Created by Desysnet on 8/25/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import Foundation
import UIKit

enum ClientDetailSectionType {
    case offer
    case history
}
struct ClientDetailSection {
    var title:String
    var type:ClientDetailSectionType
    var historycalType:HistoricalType
}

enum HistoricalType {
    case search
    case shop
    case visit
    case none
}

class ClientDetailsViewController:BaseViewController {
    
    
    static let shared = BaseViewController()
    
    let sections = [ClientDetailSection(title: "En oferta", type: .offer, historycalType: .none),
                    ClientDetailSection(title: "En rango de compra", type: .offer,historycalType: .none),
                    ClientDetailSection(title: "Relacionados", type: .offer,historycalType: .none),
                    ClientDetailSection(title: "Últimas búsquedas", type: .history,historycalType: .search),
                    ClientDetailSection(title: "Últimas compras", type: .history,historycalType: .shop),
                    ClientDetailSection(title: "Últimas visitas", type: .history,historycalType: .visit)
    ]
    
    let detailsTableView:UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.register(ClientHIstoryProductsCell.self, forCellReuseIdentifier: "his")
        v.register(ClientinfoDetailCell.self, forCellReuseIdentifier: "info")
        v.register(HorizontalOffersListCell.self, forCellReuseIdentifier: "offers")
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        layoutUI()
    }
    
    func setupUI(){
        detailsTableView.dataSource = self
        detailsTableView.delegate = self
        view.addSubview(detailsTableView)
    }
    
    func layoutUI(){
        detailsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        detailsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        detailsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        detailsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


extension ClientDetailsViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info", for: indexPath) as! ClientinfoDetailCell
            return cell
        default:
            let section = sections[indexPath.row - 1]
            let cell = tableView.dequeueReusableCell(withIdentifier: "offers", for: indexPath) as! HorizontalOffersListCell
                     cell.cellDelegate = self
            cell.title = section.title
            cell.row = indexPath.row
            cell.type = section.type
            
   
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0) {
            return 88
        }
        return 230
    }
    
    
}


extension ClientDetailsViewController : ProductCellDelegate {
    func didSelect(product: Product) {
        let vc = ProductDetailViewController()
        vc.product = product
        
  
        let nc = UINavigationController(rootViewController: vc)
              nc.modalPresentationStyle = .formSheet
        present(nc, animated: true, completion: nil)
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
protocol ProductCellDelegate:class {
    func didSelect(product:Product)
}
