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
    
    
    @objc func resultsButtonPressed() {
        output.didTapResultsButton()
    }
    
    @objc func nextStepButtonPressed() {
        output.didTapNextStepButton()
    }
    
    
    func reloadPlayerTable() {
        playerTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        output.viewDidLoad()
        bind()
    }
}

// MARK: - Configure
extension GameProcessViewController {
    
}

// MARK: View Input
extension GameProcessViewController {
    func set(player: Player?, round: Int) {
        leadingName.text = player?.name
        roundCounterLabel.text = String("\(round) Раунд")
    }
}

// MARK: Button Action
extension GameProcessViewController {
    
}
