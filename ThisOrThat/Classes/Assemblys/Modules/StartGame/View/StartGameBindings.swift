//
//  StartGameBindings.swift
//  ThisOrThat
//
//  Created by Victor on 22.04.2022.
//

import Foundation
import UIKit

extension StartGameViewController {
    
    func bind() {
        bindTableView()
        bindStartButton()
        
    }
    func bindStartButton(){
startButton.addTarget(self, action: #selector(startbuttonPressed), for: .touchUpInside)
    }
    
    
    fileprivate func bindTableView() {
        
        let footer = StartGameTableViewFooterView()
    
        footer.setup {
            [weak self] in
            self?.newPlayerButtonPressed()
        }
        
        tableView.tableFooterView = footer
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        
    }
}

extension StartGameViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        output.items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let item = output.items[indexPath.row]
            let cell = PlayerViewCell()
            .addRemoveBlock {
                [weak self] in
                self?.removeButtonDidTap(player: item)
            }
            .addChangeSexBlock {
                [weak self] in
                self?.changeSexButtonDidTap(player: item)
            }
            .setup(item: item)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
    }
}
