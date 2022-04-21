//
//  RulesViewController.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

class RulesViewController: UIViewController, UITableViewDataSource, RulesViewInput {
    var output: RulesViewOutput!
    
    
    let backgroundImage = UIImageView()
    let viewTitle = UILabel()
    
    let navigationBar = UINavigationBar()
    let tableView = UITableView()
    
    let shortAboutView = UIView()
    let howToPlayView = UIView()
    let gratitudesView = UIView()
    
    var cards = [UIView?](repeating: nil, count: 3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //output.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        
        view.addSubview(backgroundImage)
        view.addSubview(tableView)
        view.addSubview(navigationBar)
        
        
        navigationBar.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(45)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(20)
        }
        
        viewTitle.text = "Правила"
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
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(RulesCustomCell.self, forCellReuseIdentifier: RulesCustomCell.identifier)
        tableView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar).inset(65)
            make.bottom.equalToSuperview().inset(0)
            make.left.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(0)
        }
        
       
        
        
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(0)
            make.left.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(0)
        }
        
        
        
        // MARK: Карточка "Коротко об игре"
        
        shortAboutView.snp.makeConstraints { make in
            make.width.equalTo(339)
            make.height.equalTo(140)
        }
        
        
        
        
        let shortAboutBackgroundRectangle  = UIView()
        shortAboutBackgroundRectangle.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        shortAboutBackgroundRectangle.layer.opacity = 0.3
        shortAboutBackgroundRectangle.layer.cornerRadius = 10
        
        shortAboutView.addSubview(shortAboutBackgroundRectangle)
        shortAboutBackgroundRectangle.snp.makeConstraints { make in
            make.edges.equalTo(shortAboutView)
        }
        
        
        
        
        let shortAboutNameLabel = UILabel()
        shortAboutNameLabel.text = "Коротко об игре"
        shortAboutNameLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 28)
        shortAboutNameLabel.textColor = .white
        shortAboutNameLabel.textAlignment = .center
        shortAboutView.addSubview(shortAboutNameLabel)
        
        
        shortAboutNameLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(25)
            make.centerX.equalToSuperview()
            make.top.equalTo(shortAboutView).inset(15)
        }
        
        let shortAboutDescription = UILabel()
        shortAboutDescription.font = UIFont(name: "YanoneKaffeesatz-Regular", size: 15)
        shortAboutDescription.textAlignment = .left
        shortAboutDescription.textColor = .white
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.3
        shortAboutDescription.numberOfLines = 0
        shortAboutDescription.attributedText = NSMutableAttributedString(string: "Что круче – уметь летать или проходить сквозь стены? Стоит ли пожертвовать жизнью незнакомца, чтобы спасти себе часть тела? ИлиТо – это игра непростых вопросов, жаркие споры вокруг которых сделают 10 минут или 6 часов незабываемыми.", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        shortAboutView.addSubview(shortAboutDescription)
        
        shortAboutDescription.snp.makeConstraints { make in
            make.width.equalTo(330)
            make.height.equalTo(80)
            make.top.equalTo(shortAboutNameLabel).inset(30)
            //make.centerX.equalTo(shortAboutView)
            make.left.equalTo(shortAboutView).inset(14)
            make.right.equalTo(shortAboutView).inset(14)
        }
        
        
        
        
        
        
        // MARK: Карточка "Как играть"

        
        howToPlayView.snp.makeConstraints { make in
            make.width.equalTo(339)
            make.height.equalTo(310)
        }
        
        let howToPlayBackgroundRectangle  = UIView()
        howToPlayBackgroundRectangle.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        howToPlayBackgroundRectangle.layer.opacity = 0.3
        howToPlayBackgroundRectangle.layer.cornerRadius = 10
        
        howToPlayView.addSubview(howToPlayBackgroundRectangle)
        howToPlayBackgroundRectangle.snp.makeConstraints { make in
            make.edges.equalTo(howToPlayView)
        }

        let howToPlayNameLabel = UILabel()
        howToPlayNameLabel.text = "Как играть"
        howToPlayNameLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 28)
        howToPlayNameLabel.textColor = .white
        howToPlayNameLabel.textAlignment = .center
        howToPlayView.addSubview(howToPlayNameLabel)


        howToPlayNameLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(25)
            make.centerX.equalToSuperview()
            make.top.equalTo(howToPlayView).inset(15)
        }

        let howToPlayDescription = UILabel()
        howToPlayDescription.font = UIFont(name: "YanoneKaffeesatz-Regular", size: 15)
        howToPlayDescription.textAlignment = .left
        howToPlayDescription.textColor = .white
        paragraphStyle.lineHeightMultiple = 1.3
        howToPlayDescription.numberOfLines = 0
        howToPlayDescription.attributedText = NSMutableAttributedString(string: "Сам игровой процесс прост до неприличия: вы вводите имена и выбираете аватарку для всех, кто играет, выбираете наборы, в которые хотите играть, а дальше ведущий (каждый раунд игра выбирает нового) нажимает на кнопку \"Следующий вопрос\" и озвучивает то, что ему выпало, не делая выбора в пользу одной или второй альтернативы. \n \n Затем все остальные участники игры по очереди объявляют, что бы они выбрали из двух предложенных вариантов (какими бы непривлекательными или, наоборот, равносильно приятными, они не казались, выбор сделать придется) и аргументируют, почему. Ну а после того, как все, кроме ведущего, высказались, ведущий отдает свой голос одному из игроков и передает ход", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

        howToPlayView.addSubview(howToPlayDescription)

        howToPlayDescription.snp.makeConstraints { make in
            make.width.equalTo(330)
            make.height.equalTo(250)
            make.top.equalTo(howToPlayNameLabel).inset(30)
            make.centerX.equalTo(howToPlayView)
            make.left.right.equalTo(howToPlayView).inset(14)
        }
        
        
        
        // MARK: Карточка "Благодарности"

        gratitudesView.snp.makeConstraints { make in
            make.width.equalTo(339)
            make.height.equalTo(180)
        }
        
        
        let gratitudesBackgroundRectangle  = UIView()
        gratitudesBackgroundRectangle.backgroundColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        gratitudesBackgroundRectangle.layer.opacity = 0.3
        gratitudesBackgroundRectangle.layer.cornerRadius = 10
        
        gratitudesView.addSubview(gratitudesBackgroundRectangle)
        gratitudesBackgroundRectangle.snp.makeConstraints { make in
            make.edges.equalTo(gratitudesView)
        }
        

        let gratitudesNameLabel = UILabel()
        gratitudesNameLabel.text = "Благодарности"
        gratitudesNameLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 28)
        gratitudesNameLabel.textColor = .white
        gratitudesNameLabel.textAlignment = .center
        gratitudesView.addSubview(gratitudesNameLabel)


        gratitudesNameLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(25)
            make.centerX.equalToSuperview()
            make.top.equalTo(gratitudesView).inset(15)
        }

        let gratitudesDescription = UILabel()
        gratitudesDescription.font = UIFont(name: "YanoneKaffeesatz-Regular", size: 15)
        gratitudesDescription.textAlignment = .left
        gratitudesDescription.textColor = .white
        paragraphStyle.lineHeightMultiple = 1.3
        gratitudesDescription.numberOfLines = 0
        gratitudesDescription.attributedText = NSMutableAttributedString(string: "Спасибо всем, что проводите время с HotGamesSTD. Наша маленькая команда безмерно счастлива каждому игроку, а особенно тебе! Мы надеемся, что вы получите удовольствие и вернетесь к нам снова. Если вам понравилась игра. пожалуйста, оцените ее, а если нет, вы можете воспользоваться кнопкой \"ОСТАВИТЬ ОТЗЫВ\", Вас там ждет сюрприз =)", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

        gratitudesView.addSubview(gratitudesDescription)

        gratitudesDescription.snp.makeConstraints { make in
            make.width.equalTo(330)
            make.height.equalTo(120)
            make.top.equalTo(gratitudesNameLabel).inset(30)
            make.left.right.equalTo(gratitudesView).inset(14)
            make.centerX.equalTo(gratitudesView)
        }

        
        
        
        cards[0] = shortAboutView
        cards[1] = howToPlayView
        cards[2] = gratitudesView
    }
}

// MARK: - Configure
extension RulesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RulesCustomCell.identifier, for: indexPath) as! RulesCustomCell
        cell.selectionStyle = .none
        cell.card = cards[indexPath.row]!
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {return 95}
        else{
            if indexPath.row == 1 {return 405}
            else {return 135}
    }
    }
}

// MARK: View Input
extension RulesViewController {
    func set(title: String) {
        self.title = title
    }
}

// MARK: Button Action
extension RulesViewController {
    
}
