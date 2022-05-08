//
//  ResultsCell.swift
//  ThisOrThat
//
//  Created by Victor on 07.05.2022.
//

import UIKit

class ResultsCell: UITableViewCell {

    private let background = UIImageView()
    private let playerIcon = UIImageView()
    private let playerName = UILabel()
    private let score = UILabel()
    private let scoreLabel = UILabel()
    private var player: Player?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    fileprivate func layout() {
        layoutBackground()
        layoutPlayerIcon()
        layoutPlayerName()
        layoutScore()
        layoutScoreLabel()
    }

    fileprivate func layoutBackground() {
        contentView.addSubview(background)
        
        background.snp.makeConstraints { make in
            
            make.width.equalTo(339)
            make.height.equalTo(90)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    fileprivate func layoutPlayerIcon() {
        contentView.addSubview(playerIcon)
        playerIcon.cornerRadius = 30
        
        playerIcon.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(60)
            make.top.equalTo(15)
            make.left.equalTo(15)
        }
        
    }
    
    fileprivate func layoutPlayerName() {
        contentView.addSubview(playerName)
        
        playerName.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(35)
            make.left.equalTo(playerIcon).inset(75)
            make.top.equalTo(playerIcon).inset(15)
        }
    }
    
    fileprivate func layoutScore() {
        contentView.addSubview(score)
       
        score.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.top.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(15)
        }
    }
    
    fileprivate func layoutScoreLabel() {
        contentView.addSubview(scoreLabel)
        
        scoreLabel.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(20)
            make.top.equalTo(score).inset(40)
            make.centerX.equalTo(score)
        }
    }
    
    func setup(player: Player) -> ResultsCell {
        self.player = player
        
        
        playerName.text = player.name
        playerName.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 24)
        playerName.textColor = .white
        playerName.textAlignment = .left
        
        
        playerIcon.image = UIImage(named: player.image)
        if(player.sex == .man) {
            background.image = UIImage(named: "rectBlue")
        }
        else {
            background.image = UIImage(named: "rectPink")
        }
        
        
        score.text = String(player.score)
        score.textColor = .white
        score.textAlignment = .center
        score.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 36)
        
        
        scoreLabel.text = "баллов"
        scoreLabel.textColor = .white
        scoreLabel.textAlignment = .center
        scoreLabel.font = UIFont(name: "YanoneKaffeesatz-Regular", size: 18)
        
        return self
    }
}
