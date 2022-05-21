//
//  SetInfoViewController.swift
//  ThisOrThat
//
//  Created by Victor on 14.05.2022
//  
//

import UIKit

class SetInfoViewController: UIViewController, SetInfoViewInput {
    var output: SetInfoViewOutput!
    
    var backgroundImage = UIImageView()
    var exampleSetView = UIImageView()
    var exampleDescription = UILabel()
    var orLabel = UILabel()
    var premium = UIImageView()
    
    var exampleSetName = UILabel()
    var premiumLabel = UILabel()
    
    var buySetButton = UIButton()
    var premiumOnWeek = UIButton()
    var premiumOnMonth = UIButton()
    var premiumForever = UIButton()
    
    
    @objc func didTapBuySetButton() {
        
    }
    @objc func didTapPremiumOnWeekButton() {
        
    }
    @objc func didTapPremiumOnMonthButton() {
        
    }
    @objc func didTapPremiumForeverButton() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        output.viewDidLoad()
    }
}

// MARK: - Configure
extension SetInfoViewController {
    
}

// MARK: View Input
extension SetInfoViewController {
    func set() {
        exampleSetName.text = output.item.title
        exampleDescription.text = output.item.exampleQuestion
    }
}

// MARK: Button Action
extension SetInfoViewController {
    
}
