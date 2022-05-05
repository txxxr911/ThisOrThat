//
//  CatalogBindigs.swift
//  ThisOrThat
//
//  Created by Victor on 28.04.2022.
//

import Foundation

extension CatalogViewController {
    
     func bind() {
        bindTableView()
        bindBackButton()
    }
    
    fileprivate func bindTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(CatalogCustomCell.self, forCellReuseIdentifier: CatalogCustomCell.identifier)
        tableView.separatorStyle = .none
    }
    
    fileprivate func bindBackButton() {
        
    }
}
