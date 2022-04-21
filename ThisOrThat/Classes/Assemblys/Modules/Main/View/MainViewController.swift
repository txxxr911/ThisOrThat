//
//  MainViewController.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit
import SnapKit

class MainViewController: UIViewController, MainViewInput {
    var output: MainViewOutput!
    
    let backgroundImage = UIImageView()
    let logoImage = UIImageView()
    let gameStartButton = UIButton()
    let catalogButton = UIButton()
    let rulesButton = UIButton()
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        output.startbuttonPressed()
    }
    
    @IBAction func catalogButtonPressed(_ sender: UIButton) {
        
        output.catalogButtonPressed()
    }
    
    @IBAction func rulesButtonPressed(_ sender: UIButton) {
        
        output.rulesButtonPressed()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        view.addSubview(gameStartButton)
        
        view.addSubview(backgroundImage)
        view.addSubview(logoImage)
        view.addSubview(gameStartButton)
        view.addSubview(catalogButton)
        view.addSubview(rulesButton)
        //view.addSubview(otherButton)
        
        
        
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(0)
            make.left.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(0)
        }
        
        logoImage.image = UIImage(named: "logo")
        logoImage.snp.makeConstraints { make in
            make.width.equalTo(162)
            make.height.equalTo(235)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(155)
        }

        
        
        
        gameStartButton.setTitle("НАЧАТЬ", for: .normal)
        gameStartButton.titleLabel?.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 18)
        gameStartButton.titleLabel?.textAlignment = .center
        gameStartButton.backgroundColor = UIColor(red: 39/225, green: 174/255, blue: 96/255, alpha: 1)
        gameStartButton.layer.cornerRadius = 11
        gameStartButton.layer.shadowColor =  UIColor(red: 0.085, green: 0.538, blue: 0.277, alpha: 1).cgColor
        gameStartButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        gameStartButton.layer.shadowOpacity = 1
        gameStartButton.layer.shadowRadius = 0
        gameStartButton.layer.masksToBounds = false
        gameStartButton.snp.makeConstraints { make in
            make.width.equalTo(195)
            make.height.equalTo(44)
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage).inset(260)
        }
        
        catalogButton.setTitle("КАТАЛОГ", for: .normal)
        catalogButton.titleLabel?.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 18)
        catalogButton.backgroundColor = UIColor(red: 242/255, green: 153/255, blue: 74/255, alpha: 1)
        catalogButton.layer.cornerRadius = 11
        catalogButton.layer.shadowColor =  UIColor(red: 215/255, green: 122/255, blue: 39/255, alpha: 1).cgColor
        catalogButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        catalogButton.layer.shadowOpacity = 1
        catalogButton.layer.shadowRadius = 0
        catalogButton.layer.masksToBounds = false
        catalogButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(gameStartButton).inset(62)
            make.width.equalTo(195)
            make.height.equalTo(44)
        }
        
        rulesButton.setTitle("ПРАВИЛА", for: .normal)
        rulesButton.titleLabel?.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 18)
        rulesButton.backgroundColor = UIColor(red: 45/255, green: 156/255, blue: 219/255, alpha: 1)
        rulesButton.layer.cornerRadius = 11
        rulesButton.layer.shadowColor =  UIColor(red: 35/255, green: 132/255, blue: 187/255, alpha: 1).cgColor
        rulesButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        rulesButton.layer.shadowOpacity = 1
        rulesButton.layer.shadowRadius = 0
        rulesButton.layer.masksToBounds = false
        rulesButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(catalogButton).inset(62)
            make.width.equalTo(195)
            make.height.equalTo(44)
        }
        
//        otherButton.setTitle("РАЗНОЕ", for: .normal)
//        otherButton.titleLabel?.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 18)
//        otherButton.backgroundColor = UIColor(red: 219/255, green: 90/255, blue: 168/255, alpha: 1)
//        otherButton.layer.cornerRadius = 11
//        otherButton.layer.shadowColor =  UIColor(red: 187/255, green: 69/255, blue: 139/255, alpha: 1).cgColor
//        otherButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
//        otherButton.layer.shadowOpacity = 1
//        otherButton.contentVerticalAlignment = .center
//        otherButton.layer.shadowRadius = 0
//        otherButton.layer.masksToBounds = false
//        otherButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(rulesButton).inset(62)
//            make.width.equalTo(195)
//            make.height.equalTo(44)
//        }
        
       
        gameStartButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        catalogButton.addTarget(self, action: #selector(catalogButtonPressed), for: .touchUpInside)
        rulesButton.addTarget(self, action: #selector(rulesButtonPressed), for: .touchUpInside)
    }
    
}

// MARK: - Configure
extension MainViewController {
    
}

// MARK: View Input
extension MainViewController {
    func set(title: String) {
        self.title = title
    }
}

// MARK: Button Action
extension MainViewController {
    
}
