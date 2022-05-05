//
//  GameProcessViewController.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

class GameProcessViewController: UIViewController, UITableViewDataSource, GameProcessViewInput {
    var output: GameProcessViewOutput!
    
    //var input: GameProcessViewInput!
    
    let backgroundImage = UIImageView()
    var roundCounterLabel = UILabel()
    let youWillPrefferLabel = UILabel()
    var firstOption = UIImageView()
    let orLabel = UILabel()
    var secondOption = UIImageView()
    var leadingName = UILabel()
    let leadingLabel = UILabel()
    let line1 = UIImageView()
    let line2 = UIImageView()
    var playerTable = UITableView()
    let results = UIImageView()
    let nextStep = UIImageView()
    let resultsLabel = UILabel()
    let nextStepLabel = UILabel()
    let resultsButton = UIButton()
    let nextStepButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        bind()
        layout()
    }
}

// MARK: - Configure
extension GameProcessViewController {
    
}

// MARK: View Input
extension GameProcessViewController {
    func set(title: String) {
        self.title = title
    }
}

// MARK: Button Action
extension GameProcessViewController {
    
}
