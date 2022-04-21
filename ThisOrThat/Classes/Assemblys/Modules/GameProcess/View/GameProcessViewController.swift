//
//  GameProcessViewController.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

class GameProcessViewController: UIViewController, GameProcessViewInput {
    var output: GameProcessViewOutput!
    
    var backgroundImage = UIImageView()
    var roundCounterLabel = UILabel()
    var youWillPrefferLabel = UILabel()
    var firstOption = UIImageView()
    var orLabel = UILabel()
    var secondOption = UIImageView()
    var leadingName = UILabel()
    var leadingLabel = UILabel()
    var line1 = UIImageView()
    var line2 = UIImageView()
    var results = UIImageView()
    var nextStep = UIImageView()
    var resultsLabel = UILabel()
    var nextStepLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //output.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        view.addSubview(backgroundImage)
        view.addSubview(roundCounterLabel)
        view.addSubview(youWillPrefferLabel)
        view.addSubview(firstOption)
        view.addSubview(orLabel)
        view.addSubview(secondOption)
        view.addSubview(line1)
        view.addSubview(leadingName)
        view.addSubview(leadingLabel)
        view.addSubview(line2)
        view.addSubview(results)
        view.addSubview(nextStep)
        view.addSubview(resultsLabel)
        view.addSubview(nextStepLabel)
        
        
        
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        
        roundCounterLabel.text = "1 Раунд"
        roundCounterLabel.textAlignment = .center
        roundCounterLabel.textColor = .white
        roundCounterLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 36)
        
        
        roundCounterLabel.snp.makeConstraints { make in
            make.width.equalTo(90)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(20)
        }
        
        
        youWillPrefferLabel.text = "Вы бы предпочли"
        youWillPrefferLabel.textAlignment = .center
        youWillPrefferLabel.textColor = .white
        youWillPrefferLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 24)
        
        youWillPrefferLabel.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.top.equalTo(roundCounterLabel).inset(70)
        }
        
        
        firstOption.image = UIImage(named: "cardBlue")
        
        firstOption.snp.makeConstraints { make in
            make.width.equalTo(340)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
            make.top.equalTo(youWillPrefferLabel).inset(40)
        }
        
        orLabel.text = "ИЛИ"
        orLabel.textAlignment = .center
        orLabel.textColor = .white
        orLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 24)
        
        orLabel.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(firstOption).inset(65)
        }
        
        
        secondOption.image = UIImage(named: "cardPink")
        
        secondOption.snp.makeConstraints { make in
            make.width.equalTo(340)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
            make.top.equalTo(firstOption).inset(85)
        }
        
        
        line1.image = UIImage(named: "line")
        line2.image = UIImage(named: "line")
        
        line1.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(1)
            make.top.equalTo(secondOption).inset(110)
            make.left.equalToSuperview().inset(10)
        }
        
        line2.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(1)
            make.top.equalTo(secondOption).inset(110)
            make.right.equalToSuperview().inset(10)
        }
        
        leadingName.text = "Василий"
        leadingName.textColor = .white
        leadingName.numberOfLines = 2
        leadingName.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 20)
        leadingName.textAlignment = .center
        
        leadingName.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.top.equalTo(secondOption).inset(90)
        }
        
        
        leadingLabel.text = "Ведущий"
        leadingLabel.textColor = .white
        leadingLabel.numberOfLines = 2
        leadingLabel.font = UIFont(name: "YanoneKaffeesatz-Regular", size: 18)
        leadingLabel.textAlignment = .center
        
        leadingLabel.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.top.equalTo(leadingName).inset(20)
        }
        
        
        
        results.image = UIImage(named: "resultsButton")
        results.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(45)
            make.bottom.equalTo(-10)
            make.left.equalToSuperview().inset(20)
        }
        
        
        nextStep.image = UIImage(named: "nextStepButton")
        nextStep.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(45)
            make.bottom.equalTo(-10)
            make.right.equalToSuperview().inset(20)
        }
        
        
        resultsLabel.text = "Результаты"
        resultsLabel.font = UIFont(name: "YanoneKaffeesatz-Regular", size: 18)
        resultsLabel.textColor = .white
        resultsLabel.textAlignment = .center
        
        resultsLabel.snp.makeConstraints { make in
            make.edges.equalTo(results)
        }
        
        
        nextStepLabel.text = "Передать ход"
        nextStepLabel.font = UIFont(name: "YanoneKaffeesatz-Regular", size: 18)
        nextStepLabel.textColor = .white
        nextStepLabel.textAlignment = .center
        
        nextStepLabel.snp.makeConstraints { make in
            make.edges.equalTo(nextStep)
        }
        
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
