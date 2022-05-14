//
//  CatalogViewController.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

class CatalogViewController: UIViewController, CatalogViewInput {
    var output: CatalogViewOutput!
    
    let backgroundImage = UIImageView()
    let viewTitle = UILabel()
    
    
    let navigationBar = UINavigationBar()
    let tableView = UITableView()
    
    let superPopularRectangleView = UIView()
    let superPopularText = UILabel()
    
    let onMonthView = UIView()
    let trySetView = UIView()
    let cinemaView = UIView()
    let romanticView = UIView()
    let schoolView = UIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        bind()
    }
    
    
}

// MARK: - Configure


// MARK: View Input
extension CatalogViewController {
    func set(title: String) {
    }
}

// MARK: Button Action
extension CatalogViewController {
    
}



