//
//  StartGameViewController.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

class StartGameViewController: UIViewController, UITableViewDataSource,  StartGameViewInput {
    var output: StartGameViewOutput!
    
    var playerDataArray: [PlayerData] = []
    
    let backgroundImage = UIImageView()
    let viewTitle = UILabel()
    
    let navigationBar = UINavigationBar()
    let tableView = UITableView()
    
    
    let newPlayerView = UIView()
    let registeredPlayerMaleView = UIView()
    let registeredPlayerFemaleView = UIView()
    var playerArray = [UIView?](repeating: nil, count: 1)
    
    
    let startButtonImage = UIImageView()
    let startButton = UIButton()
    let startLabel = UILabel()
    
    let newPlayerButton = UIButton()
    
    
    
    
    @IBAction func newPlayerButtonPressed(_ sender: UIButton) {
        
        createNewPlayer()
    }
    
    
    @IBAction func startbuttonPressed(_ sender: UIButton) {
        
        output.startButtonPressed()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //output.viewDidLoad()
        initialize()
    }
    
    func createNewPlayer() {
        
        var iconName = "male"
        
        let newPlayer = UIView()
        
        newPlayer.snp.makeConstraints { make in
            make.width.equalTo(339)
            make.height.equalTo(90)
        }
        
        let registeredPlayerMaleBackgroundRect = UIImageView()
        registeredPlayerMaleBackgroundRect.image = UIImage(named: "rectBlue")
        
        
        newPlayer.addSubview(registeredPlayerMaleBackgroundRect)
        registeredPlayerMaleBackgroundRect.snp.makeConstraints { make in
            make.edges.equalTo(newPlayer)
        }
        
        
        
        let playerIcon = UIImageView()
        playerIcon.image = UIImage(named: iconName)
        playerIcon.layer.cornerRadius = 30
        playerIcon.clipsToBounds = true
        newPlayer.addSubview(playerIcon)
        playerIcon.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(60)
            make.top.equalTo(15)
            make.left.equalTo(15)
        }
        
        
        
        
        let playerName = UITextField()
        playerName.text = "Введите имя"
        playerName.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 24)
        playerName.textColor = .lightGray
        playerName.textAlignment = .left
        
        newPlayer.addSubview(playerName)
        playerName.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(35)
            make.left.equalTo(playerIcon).inset(75)
            make.top.equalTo(playerIcon).inset(15)
        }
        
        
        
        
        let cancelButtonMale = UIImageView()
        cancelButtonMale.image = UIImage(named: "cancelButton")
        
        newPlayer.addSubview(cancelButtonMale)
        cancelButtonMale.snp.makeConstraints { make in
            make.width.height.equalTo(10)
            make.top.equalTo(15)
            make.right.equalTo(15)
        }
        
        playerArray.insert(newPlayer, at: 0)
        tableView.reloadData()
        
    }
    
    func initialize() {
        
        view.addSubview(backgroundImage)
        view.addSubview(tableView)
        view.addSubview(navigationBar)
        view.addSubview(startButtonImage)
        view.addSubview(startLabel)
        view.addSubview(startButton)
        //view.addSubview(newPlayerButton)
        
        
        
        
        
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        
        navigationBar.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(45)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(20)
        }
        
        
        viewTitle.text = "Игроки"
        viewTitle.textColor = .white
        viewTitle.textAlignment = .center
        viewTitle.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 36)
        navigationBar.addSubview(viewTitle)
        viewTitle.snp.makeConstraints { make in
            make.width.equalTo(162)
            make.height.equalTo(39)
            make.top.equalTo(navigationBar).inset(3)
            make.centerX.equalTo(navigationBar)
        }
        
        
        // MARK: Карточка "Новый игрок"
        
        
        newPlayerView.snp.makeConstraints { make in
            make.width.equalTo(339)
            make.height.equalTo(85)
        }
        
        
        let newPlayerViewBackground = UIImageView()
        newPlayerViewBackground.image = UIImage(named: "newPlayer")
        
        newPlayerView.addSubview(newPlayerViewBackground)
        newPlayerViewBackground.snp.makeConstraints { make in
            make.edges.equalTo(newPlayerView)
        }
        
        
        
        let newPlayerNameLabel = UILabel()
        newPlayerNameLabel.text = "Новый игрок"
        newPlayerNameLabel.font = UIFont(name:"YanoneKaffeesatz-Bold" , size: 24)
        newPlayerNameLabel.textColor = .gray
        newPlayerNameLabel.textAlignment = .left
        
        newPlayerView.addSubview(newPlayerNameLabel)
        newPlayerNameLabel.snp.makeConstraints { make in
            make.left.equalTo(newPlayerView).inset(85)
            make.top.equalTo(newPlayerView).inset(35)
        }
        
        newPlayerView.addSubview(newPlayerButton)
        
        // MARK: "Карточка зарегистрированный мужской пол"
        
//        registeredPlayerMaleView.snp.makeConstraints { make in
//            make.width.equalTo(339)
//            make.height.equalTo(90)
//        }
//
//
//
//        let registeredPlayerMaleBackgroundRect = UIImageView()
//        registeredPlayerMaleBackgroundRect.image = UIImage(named: "rectBlue")
//
//
//        registeredPlayerMaleView.addSubview(registeredPlayerMaleBackgroundRect)
//        registeredPlayerMaleBackgroundRect.snp.makeConstraints { make in
//            make.edges.equalTo(registeredPlayerMaleView)
//        }
//
//
//
//        let playerMaleIcon = UIImageView()
//        playerMaleIcon.image = UIImage(named: "male")
//        playerMaleIcon.layer.cornerRadius = 30
//        playerMaleIcon.clipsToBounds = true
//        registeredPlayerMaleView.addSubview(playerMaleIcon)
//        playerMaleIcon.snp.makeConstraints { make in
//            make.width.equalTo(60)
//            make.height.equalTo(60)
//            make.top.equalTo(15)
//            make.left.equalTo(15)
//        }
//
//
//
//
//        let playerNameMale = UITextField()
//        playerNameMale.text = "Введите имя"
//        playerNameMale.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 24)
//        playerNameMale.textColor = .lightGray
//        playerNameMale.textAlignment = .left
//
//        registeredPlayerMaleView.addSubview(playerNameMale)
//        playerNameMale.snp.makeConstraints { make in
//            make.width.equalTo(150)
//            make.height.equalTo(35)
//            make.left.equalTo(playerMaleIcon).inset(75)
//            make.top.equalTo(playerMaleIcon).inset(15)
//        }
//
//
//
//
//        let cancelButtonMale = UIImageView()
//        cancelButtonMale.image = UIImage(named: "cancelButton")
//
//        registeredPlayerMaleView.addSubview(cancelButtonMale)
//        cancelButtonMale.snp.makeConstraints { make in
//            make.width.height.equalTo(10)
//            make.top.equalTo(15)
//            make.right.equalTo(15)
//        }
        
        
        // MARK: "Карточка зарегистрированный женский пол"
        
        
        
//        registeredPlayerFemaleView.snp.makeConstraints { make in
//            make.width.equalTo(339)
//            make.height.equalTo(90)
//        }
//
//
//        let registeredPlayerFemaleBackgroundRect = UIImageView()
//        registeredPlayerFemaleBackgroundRect.image = UIImage(named: "rectPink")
//
//
//        registeredPlayerFemaleView.addSubview(registeredPlayerFemaleBackgroundRect)
//        registeredPlayerFemaleBackgroundRect.snp.makeConstraints { make in
//            make.edges.equalTo(registeredPlayerFemaleView)
//        }
//
//
//        let playerIconFemale = UIImageView()
//        playerIconFemale.image = UIImage(named: "female")
//        playerIconFemale.layer.cornerRadius = 30
//        playerIconFemale.clipsToBounds = true
//
//        registeredPlayerFemaleView.addSubview(playerIconFemale)
//        playerIconFemale.snp.makeConstraints { make in
//            make.width.equalTo(60)
//            make.height.equalTo(60)
//            make.top.equalTo(15)
//            make.left.equalTo(15)
//        }
//
//
//
//
//        let playerNameFemale = UITextField()
//        playerNameFemale.text = "Введите имя"
//        playerNameFemale.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 24)
//        playerNameFemale.textColor = .gray
//        playerNameFemale.textAlignment = .left
//
//
//
//
//        registeredPlayerFemaleView.addSubview(playerNameFemale)
//        playerNameFemale.snp.makeConstraints { make in
//            make.width.equalTo(150)
//            make.height.equalTo(35)
//            make.left.equalTo(playerIconFemale).inset(75)
//            make.top.equalTo(playerIconFemale).inset(15)
//        }
//
//
//
//        let cancelButtonFemale = UIImageView()
//        cancelButtonFemale.image = UIImage(named: "cancelButton")
//
//        registeredPlayerFemaleView.addSubview(cancelButtonFemale)
//        cancelButtonFemale.snp.makeConstraints { make in
//            make.width.height.equalTo(10)
//            make.top.equalTo(15)
//            make.right.equalTo(15)
//        }
        
        
        // MARK: Кнопка "Начать"
        
        
        startButtonImage.image = UIImage(named: "startButton")
        
        
        startButtonImage.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-20)
        }
        
        startLabel.text = "Начать"
        startLabel.textColor = .white
        startLabel.textAlignment = .center
        startLabel.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 24)
        
        startLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-20)
        }
        
        startButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-20)
        }
        
        startButton.addTarget(self, action: #selector(startbuttonPressed), for: .touchUpInside)
        
        
        // MARK: Кнопка "Новый игрок"
        
        newPlayerButton.snp.makeConstraints { make in
            make.width.equalTo(339)
            make.height.equalTo(85)
            make.edges.equalTo(newPlayerView)
        }
        newPlayerButton.addTarget(self, action: #selector(newPlayerButtonPressed), for: .touchUpInside)
        
        
        
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(StartCustomCell.self, forCellReuseIdentifier: StartCustomCell.identifier)
        tableView.contentInset = UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar).inset(0)
            make.bottom.equalToSuperview().inset(0)
            make.left.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(0)
        }
        
        playerArray[0] = newPlayerView
        
    }
}

// MARK: - Configure
extension StartGameViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        playerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: StartCustomCell.identifier, for: indexPath) as! StartCustomCell
        
        cell.selectionStyle = .none
        cell.card = playerArray[indexPath.row]!
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: View Input
extension StartGameViewController {
    func set(title: String) {
        self.title = title
    }
}

// MARK: Button Action
extension StartGameViewController {
    
}
