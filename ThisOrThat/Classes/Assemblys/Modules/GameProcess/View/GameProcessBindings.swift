//
//  GameProcessBindings.swift
//  ThisOrThat
//
//  Created by Victor on 03.05.2022.
//

import Foundation
import UIKit

extension GameProcessViewController {
    
    func bind() {
        bindPlayerTable()
        bindResultsButton()
        bindNextStepButton()
    }
    
    func bindPlayerTable() {
        playerTable.dataSource = self
        playerTable.delegate = self
        playerTable.backgroundColor = .clear
        playerTable.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func bindResultsButton() {
        //resultsButton.addTarget(self, action: #selector(resultsButtonPressed), for: .touchUpInside)
    }
    
    func bindNextStepButton() {
        //nextStepButton.addTarget(self, action: #selector(nextStepButtonPressed), for: .touchUpInside)
    }
    
    
}

extension GameProcessViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        output.items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let item = output.items[indexPath.row]
            let cell = PlayerCell()
            .setup(item: item)
        
        cell.backgroundColor = .clear
        //cell.selectionStyle = .none
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
                
    }
    
}
