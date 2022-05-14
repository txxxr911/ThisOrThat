//
//  CatalogBindigs.swift
//  ThisOrThat
//
//  Created by Victor on 28.04.2022.
//

import Foundation
import UIKit

extension CatalogViewController {
    
     func bind() {
        bindTableView()
        bindBackButton()
    }
    
    fileprivate func bindTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        let header = CatalogTableHeaderVIew()
        tableView.tableHeaderView = header
    }
    
    fileprivate func bindBackButton() {
        
    }
}

extension CatalogViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        168
    }
}

extension CatalogViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let item = output.items[indexPath.row] as? CardSet {
            
            let cell = CatalogCustomCell()
                                        .setup(item: item)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            return cell
        }
        
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectItem(item: output.items[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
