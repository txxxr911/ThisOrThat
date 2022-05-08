//
//  ResultsBindings.swift
//  ThisOrThat
//
//  Created by Victor on 07.05.2022.
//

import Foundation
import UIKit

extension ResultsViewController {
    
    func bind() {
        bindEndButton()
        bindTableView()
    }
    
    func bindEndButton() {
        endButton.addTarget(self, action: #selector(endButtonPressed), for: .touchUpInside)
    }
    
    fileprivate func bindTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension ResultsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let player = output.players[indexPath.row]
            let cell = ResultsCell()
                                    .setup(player: player)
        return cell
    }
}
