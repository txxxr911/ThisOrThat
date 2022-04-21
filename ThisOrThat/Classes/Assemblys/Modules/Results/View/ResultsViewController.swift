//
//  ResultsViewController.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

class ResultsViewController: UIViewController, ResultsViewInput {
    var output: ResultsViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
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
