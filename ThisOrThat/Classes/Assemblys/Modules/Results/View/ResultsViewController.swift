//
//  ResultsViewController.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDataSource, ResultsViewInput {
    var output: ResultsViewOutput!
    
    var backgroundImage = UIImageView()
    var viewTitle = UILabel()
    
    var navigationBar = UINavigationBar()
    var tableView = UITableView()
    
    
    let endButtonImage = UIImageView()
    let endLabel = UILabel()
    let endButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        bind()
    }
    
    @objc func endButtonPressed() {
        output.endGame()
        
    }
}

// MARK: - Configure
extension ResultsViewController {
    
}

// MARK: View Input
extension ResultsViewController {
    func set(title: String) {
        self.title = title
    }
}

// MARK: Button Action
extension ResultsViewController {
    
}
