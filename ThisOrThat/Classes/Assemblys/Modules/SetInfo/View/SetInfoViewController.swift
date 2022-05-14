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
    var orLabel = UILabel()
    var premium = UIImageView()
    
    var exampleSetName = UILabel()
    var premiumLabel = UILabel()
    
    var premiumOnWeek = UIButton()
    var premiumOnMonth = UIButton()
    var premiumForever = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }
}

// MARK: - Configure
extension SetInfoViewController {
    
}

// MARK: View Input
extension SetInfoViewController {
    func set(title: String) {
        self.title = title
    }
}

// MARK: Button Action
extension SetInfoViewController {
    
}
