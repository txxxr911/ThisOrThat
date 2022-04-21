//
//  CatalogViewController.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

class CatalogViewController: UIViewController, UITableViewDataSource, CatalogViewInput {
    var output: CatalogViewOutput!
    
    let backgroundImage = UIImageView()
    let viewTitle = UILabel()
    
    
    let navigationBar = UINavigationBar()
    let tableView = UITableView()
    
    let superPopularRectangleView = UIView()
    let superPopularText = UILabel()
    
    let onMonthView = UIView()
    let trySetView = UIView()
    let cinemaView = UIView()
    let romanticView = UIView()
    let schoolView = UIView()
    
    
    var cards = [UIView?](repeating: nil, count: 6)
    
    
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
        viewTitle.text = "Каталог"
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
        tableView.register(CatalogCustomCell.self, forCellReuseIdentifier: CatalogCustomCell.identifier)
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
        
        
        
        
        
        superPopularRectangleView.snp.makeConstraints { make in
            make.width.equalTo(239)
            make.height.equalTo(36)
        }
        let superPopularRectangleBackground = UIImageView()
        superPopularRectangleBackground.image = UIImage(named: "superPopularRect")
        superPopularRectangleView.addSubview(superPopularRectangleBackground)
        superPopularRectangleBackground.snp.makeConstraints { make in
            make.edges.equalTo(superPopularRectangleView)
        }
        
        
        
        superPopularText.text = "СУПЕР ПОПУЛЯРНО"
        superPopularText.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.32)
        superPopularText.textAlignment = .center
        superPopularText.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 18)
        superPopularRectangleView.addSubview(superPopularText)
        superPopularText.snp.makeConstraints { make in
            make.width.equalTo(239)
            make.height.equalTo(36)
            make.top.equalTo(superPopularRectangleBackground).inset(3)
            make.centerX.equalTo(superPopularRectangleBackground)
            
        }
        
        // MARK: Карточка "На месяц"
        
        onMonthView.snp.makeConstraints { make in
            make.width.equalTo(339)
            make.height.equalTo(154)
        }
        
        let onMonthViewBackground = UIImageView()
        onMonthViewBackground.image = UIImage(named: "onMonthCardRectangle")
        onMonthView.addSubview(onMonthViewBackground)
        onMonthViewBackground.layer.shadowColor = UIColor(red: 46/255, green: 146/255, blue: 87/255, alpha: 1).cgColor
        onMonthViewBackground.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        onMonthViewBackground.layer.shadowOpacity = 1
        onMonthViewBackground.layer.shadowRadius = 0
        onMonthViewBackground.layer.masksToBounds = false
        onMonthViewBackground.snp.makeConstraints { make in
            make.edges.equalTo(onMonthView)
        }
        
        let onMonthNameLabel = UILabel()
        onMonthNameLabel.text = "На месяц"
        onMonthNameLabel.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 24)
        onMonthNameLabel.textColor = .white
        onMonthNameLabel.textAlignment = .left
        onMonthView.addSubview(onMonthNameLabel)
        
        onMonthNameLabel.snp.makeConstraints { make in
            make.width.equalTo(162)
            make.height.equalTo(38)
            make.top.equalTo(onMonthView).inset(10)
            make.left.equalTo(onMonthView).inset(123.1)
        }
        
        let onMonthDescription = UILabel()
        
        onMonthDescription.font = UIFont(name: "YanoneKaffeesatz-Regular", size: 16)
        onMonthDescription.textColor = .white
        onMonthDescription.textAlignment = .left
        onMonthDescription.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1
        onMonthDescription.attributedText = NSMutableAttributedString(string: "Самый удобный, дешевый и надежный способ поучить все наши наборы на целый месяц!", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

        onMonthView.addSubview(onMonthDescription)
        
        onMonthDescription.snp.makeConstraints { make in
            make.width.equalTo(215)
            make.height.equalTo(45)
            make.top.equalTo(onMonthView).inset(54)
            make.left.equalTo(onMonthView).inset(123.1)
        }
        
        
        let onMonthtasksCount = UILabel()
        
        onMonthtasksCount.text = "190 заданий"
        onMonthtasksCount.font = UIFont(name:  "YanoneKaffeesatz-Regular", size: 14)
        onMonthtasksCount.textColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        onMonthtasksCount.textAlignment = .left
        onMonthtasksCount.numberOfLines = 0
        
        onMonthView.addSubview(onMonthtasksCount)
        
        onMonthtasksCount.snp.makeConstraints { make in
            make.width.equalTo(189)
            make.height.equalTo(38)
            make.top.equalTo(111).inset(111)
            make.left.equalTo(123).inset(123)
        }
        
        let buyButtonShadowOnMonth = UIImageView()
        buyButtonShadowOnMonth.image = UIImage(named: "buy_shadow")
        onMonthView.addSubview(buyButtonShadowOnMonth)
        buyButtonShadowOnMonth.snp.makeConstraints { make in
            make.width.equalTo(92)
            make.height.equalTo(32)
            make.top.equalTo(111)
            make.left.equalTo(236)
        }
        
        let buyOnMonthLabel = UILabel()
        buyOnMonthLabel.text = "КУПИТЬ"
        buyOnMonthLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 18)
        buyOnMonthLabel.textColor = .white
        buyOnMonthLabel.textAlignment = .center
        buyOnMonthLabel.numberOfLines = 0
        buyOnMonthLabel.backgroundColor = .clear
        
        onMonthView.addSubview(buyOnMonthLabel)
        buyOnMonthLabel.snp.makeConstraints { make in
            make.width.equalTo(107)
            make.height.equalTo(38)
            make.top.equalTo(onMonthView).inset(111)
            make.left.equalTo(onMonthView).inset(231)
        }

        
        let onMonthButton = UIButton()
        onMonthView.addSubview(onMonthButton)
        
        onMonthButton.snp.makeConstraints { make in
            make.edges.equalTo(onMonthView)
        }
        
        
        let onMonthIcon = UIImageView()
        onMonthIcon.image = UIImage(named: "onMonthIcon")
        onMonthView.addSubview(onMonthIcon)
        
        onMonthIcon.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.top.equalTo(onMonthView).inset(20)
            make.left.equalTo(onMonthView).inset(13)
   }
        
        
        // MARK: Карточка "Пробный набор"
       
        trySetView.snp.makeConstraints { make in
            make.width.equalTo(339)
            make.height.equalTo(154)
            
        }
        
        let trySetViewBackground = UIImageView()
        
        trySetViewBackground.image = UIImage(named: "trySetCardRectangle")
        trySetView.addSubview(trySetViewBackground)
        
        
        trySetViewBackground.layer.shadowColor = UIColor(red: 114/255, green: 78/255, blue: 44/255, alpha: 1).cgColor
        trySetViewBackground.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        trySetViewBackground.layer.shadowOpacity = 1
        trySetViewBackground.layer.shadowRadius = 0
        trySetViewBackground.layer.masksToBounds = false
        trySetViewBackground.snp.makeConstraints { make in
            make.edges.equalTo(trySetView)
        }
        
        let trySetNameLabel = UILabel()
        trySetNameLabel.text = "Пробный набор"
        trySetNameLabel.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 24)
        trySetNameLabel.textColor = .white
        trySetNameLabel.textAlignment = .left
        trySetView.addSubview(trySetNameLabel)
        
        trySetNameLabel.snp.makeConstraints { make in
            make.width.equalTo(162)
            make.height.equalTo(38)
            make.top.equalTo(trySetView).inset(10)
            make.left.equalTo(trySetView).inset(123.1)
        }
        
        let trySetDescription = UILabel()
        
        trySetDescription.font = UIFont(name: "YanoneKaffeesatz-Regular", size: 16)
        trySetDescription.textColor = .white
        trySetDescription.textAlignment = .left
        trySetDescription.numberOfLines = 0
        //let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1
        trySetDescription.attributedText = NSMutableAttributedString(string: "В этом наборе собраны задания из всех наборов, попробуйте и не пожалеете", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

        trySetView.addSubview(trySetDescription)
        
        trySetDescription.snp.makeConstraints { make in
            make.width.equalTo(215)
            make.height.equalTo(45)
            make.top.equalTo(trySetView).inset(54)
            make.left.equalTo(trySetView).inset(123.1)
        }
        
        
        let trySetTasksCount = UILabel()
        
        trySetTasksCount.text = "60 заданий"
        trySetTasksCount.font = UIFont(name:  "YanoneKaffeesatz-Regular", size: 14)
        trySetTasksCount.textColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        trySetTasksCount.textAlignment = .left
        trySetTasksCount.numberOfLines = 0
        
        trySetView.addSubview(trySetTasksCount)
        
        trySetTasksCount.snp.makeConstraints { make in
            make.width.equalTo(189)
            make.height.equalTo(38)
            make.top.equalTo(trySetView).inset(111)
            make.left.equalTo(trySetView).inset(123)
        }
        
        let buyButtonShadowtrySet = UIImageView()
        buyButtonShadowtrySet.image = UIImage(named: "buy_shadow")
        
        trySetView.addSubview(buyButtonShadowtrySet)
        buyButtonShadowtrySet.snp.makeConstraints { make in
            make.width.equalTo(92)
            make.height.equalTo(32)
            make.top.equalTo(111)
            make.left.equalTo(236)
        }
        
        let buytrySetLabel = UILabel()
        buytrySetLabel.text = "Выключить"
        buytrySetLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 18)
        buytrySetLabel.textColor = .white
        buytrySetLabel.textAlignment = .center
        buytrySetLabel.numberOfLines = 0
        
        trySetView.addSubview(buytrySetLabel)
        buytrySetLabel.snp.makeConstraints { make in
            make.width.equalTo(107)
            make.height.equalTo(38)
            make.top.equalTo(trySetView).inset(111)
            make.left.equalTo(trySetView).inset(231)
        }

        
        let trySetButton = UIButton()
        trySetView.addSubview(trySetButton)
        
        trySetButton.snp.makeConstraints { make in
            make.edges.equalTo(trySetView)
        }
        
        
        let trySetIcon = UIImageView()
        trySetIcon.image = UIImage(named: "onMonthIcon")
        trySetView.addSubview(trySetIcon)
        
        trySetIcon.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.top.equalTo(trySetView).inset(20)
            make.left.equalTo(trySetView).inset(13)
        }
        
        
        // MARK: Карточка "Кино"
        
        cinemaView.snp.makeConstraints { make in
            make.width.equalTo(339)
            make.height.equalTo(154)
           
        }


        let cinemaViewBackground = UIImageView()
        cinemaViewBackground.image = UIImage(named: "cinemaCardRectangle")
        cinemaView.addSubview(cinemaViewBackground)
        cinemaViewBackground.layer.shadowColor = UIColor(red: 39/255, green: 77/255, blue: 107/255, alpha: 1).cgColor
        cinemaViewBackground.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        cinemaViewBackground.layer.shadowOpacity = 1
        cinemaViewBackground.layer.shadowRadius = 0
        cinemaViewBackground.layer.masksToBounds = false
        cinemaViewBackground.snp.makeConstraints { make in
            make.edges.equalTo(cinemaView)
        }

        let cinemaNameLabel = UILabel()
        cinemaNameLabel.text = "Кино"
        cinemaNameLabel.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 24)
        cinemaNameLabel.textColor = .white
        cinemaNameLabel.textAlignment = .left
        cinemaView.addSubview(cinemaNameLabel)

        cinemaNameLabel.snp.makeConstraints { make in
            make.width.equalTo(162)
            make.height.equalTo(38)
            make.top.equalTo(cinemaView).inset(10)
            make.left.equalTo(cinemaView).inset(123.1)
        }

        let cinemaDescription = UILabel()

        cinemaDescription.font = UIFont(name: "YanoneKaffeesatz-Regular", size: 16)
        cinemaDescription.textColor = .white
        cinemaDescription.textAlignment = .left
        cinemaDescription.numberOfLines = 0
        //let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1
        cinemaDescription.attributedText = NSMutableAttributedString(string: "Бетмен или Супермен, комедии или ужасы, докажи, что твое мнение самое верное", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

        cinemaView.addSubview(cinemaDescription)

        cinemaDescription.snp.makeConstraints { make in
            make.width.equalTo(215)
            make.height.equalTo(45)
            make.top.equalTo(cinemaView).inset(54)
            make.left.equalTo(cinemaView).inset(123.1)
        }


        let cinematasksCount = UILabel()

        cinematasksCount.text = "41 задание"
        cinematasksCount.font = UIFont(name:  "YanoneKaffeesatz-Regular", size: 14)
        cinematasksCount.textColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        cinematasksCount.textAlignment = .left
        cinematasksCount.numberOfLines = 0

        cinemaView.addSubview(cinematasksCount)

        cinematasksCount.snp.makeConstraints { make in
            make.width.equalTo(189)
            make.height.equalTo(38)
            make.top.equalTo(111).inset(111)
            make.left.equalTo(123).inset(123)
        }

        let buyButtonShadowcinema = UIImageView()
        buyButtonShadowcinema.image = UIImage(named: "buy_shadow")
        cinemaView.addSubview(buyButtonShadowcinema)
        buyButtonShadowcinema.snp.makeConstraints { make in
            make.width.equalTo(92)
            make.height.equalTo(32)
            make.top.equalTo(111)
            make.left.equalTo(236)
        }

        let buycinemaLabel = UILabel()
        buycinemaLabel.text = "КУПИТЬ"
        buycinemaLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 18)
        buycinemaLabel.textColor = .white
        buycinemaLabel.textAlignment = .center
        buycinemaLabel.numberOfLines = 0
        buycinemaLabel.backgroundColor = .clear

        cinemaView.addSubview(buycinemaLabel)
        buycinemaLabel.snp.makeConstraints { make in
            make.width.equalTo(107)
            make.height.equalTo(38)
            make.top.equalTo(cinemaView).inset(111)
            make.left.equalTo(cinemaView).inset(231)
        }


        let cinemaButton = UIButton()
        cinemaView.addSubview(cinemaButton)

        cinemaButton.snp.makeConstraints { make in
            make.edges.equalTo(cinemaView)
        }


        let cinemaIcon = UIImageView()
        cinemaIcon.image = UIImage(named: "cinemaIcon")
        cinemaView.addSubview(cinemaIcon)

        cinemaIcon.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.top.equalTo(cinemaView).inset(20)
            make.left.equalTo(cinemaView).inset(13)
        }
        
        
        
        // MARK: Карточка "Для взрослых"
        
        
        
       romanticView.snp.makeConstraints { make in
        make.width.equalTo(339)
        make.height.equalTo(154)
       
    }


    let romanticViewBackground = UIImageView()
    romanticViewBackground.image = UIImage(named: "romanticCardRectangle")
    romanticView.addSubview(romanticViewBackground)
    romanticViewBackground.layer.shadowColor = UIColor(red: 101/255, green: 49/255, blue: 82/255, alpha: 1).cgColor
    romanticViewBackground.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
    romanticViewBackground.layer.shadowOpacity = 1
    romanticViewBackground.layer.shadowRadius = 0
    romanticViewBackground.layer.masksToBounds = false
    romanticViewBackground.snp.makeConstraints { make in
        make.edges.equalTo(romanticView)
    }

    let romanticNameLabel = UILabel()
    romanticNameLabel.text = "Для взрослых"
    romanticNameLabel.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 24)
    romanticNameLabel.textColor = .white
    romanticNameLabel.textAlignment = .left
    romanticView.addSubview(romanticNameLabel)

    romanticNameLabel.snp.makeConstraints { make in
        make.width.equalTo(162)
        make.height.equalTo(38)
        make.top.equalTo(romanticView).inset(10)
        make.left.equalTo(romanticView).inset(123.1)
    }

    let romanticDescription = UILabel()

    romanticDescription.font = UIFont(name: "YanoneKaffeesatz-Regular", size: 16)
    romanticDescription.textColor = .white
    romanticDescription.textAlignment = .left
    romanticDescription.numberOfLines = 0
    //let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineHeightMultiple = 1
    romanticDescription.attributedText = NSMutableAttributedString(string: "Хотите обсудить запретные темы или узнать самое сокровенное? Этот набор точно для вас!", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

    romanticView.addSubview(romanticDescription)

    romanticDescription.snp.makeConstraints { make in
        make.width.equalTo(215)
        make.height.equalTo(45)
        make.top.equalTo(romanticView).inset(54)
        make.left.equalTo(romanticView).inset(123.1)
    }


    let romantictasksCount = UILabel()

    romantictasksCount.text = "39 заданий"
    romantictasksCount.font = UIFont(name:  "YanoneKaffeesatz-Regular", size: 14)
    romantictasksCount.textColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
    romantictasksCount.textAlignment = .left
    romantictasksCount.numberOfLines = 0

    romanticView.addSubview(romantictasksCount)

    romantictasksCount.snp.makeConstraints { make in
        make.width.equalTo(189)
        make.height.equalTo(38)
        make.top.equalTo(111).inset(111)
        make.left.equalTo(123).inset(123)
    }

    let buyButtonShadowromantic = UIImageView()
    buyButtonShadowromantic.image = UIImage(named: "buy_shadow")
    romanticView.addSubview(buyButtonShadowromantic)
    buyButtonShadowromantic.snp.makeConstraints { make in
        make.width.equalTo(92)
        make.height.equalTo(32)
        make.top.equalTo(111)
        make.left.equalTo(236)
    }

    let buyromanticLabel = UILabel()
    buyromanticLabel.text = "КУПИТЬ"
    buyromanticLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 18)
    buyromanticLabel.textColor = .white
    buyromanticLabel.textAlignment = .center
    buyromanticLabel.numberOfLines = 0
    buyromanticLabel.backgroundColor = .clear

    romanticView.addSubview(buyromanticLabel)
    buyromanticLabel.snp.makeConstraints { make in
        make.width.equalTo(107)
        make.height.equalTo(38)
        make.top.equalTo(romanticView).inset(111)
        make.left.equalTo(romanticView).inset(231)
    }


    let romanticButton = UIButton()
    romanticView.addSubview(romanticButton)

    romanticButton.snp.makeConstraints { make in
        make.edges.equalTo(romanticView)
    }


    let romanticIcon = UIImageView()
    romanticIcon.image = UIImage(named: "romanticIcon")
    romanticView.addSubview(romanticIcon)

    romanticIcon.snp.makeConstraints { make in
        make.width.equalTo(100)
        make.height.equalTo(100)
        make.top.equalTo(romanticView).inset(20)
        make.left.equalTo(romanticView).inset(13)
    }
     
        // MARK: Карточка "Школьникам"
        
        schoolView.snp.makeConstraints { make in
            make.width.equalTo(339)
            make.height.equalTo(154)
          
        }


        let schoolViewBackground = UIImageView()
        schoolViewBackground.image = UIImage(named: "schoolCardRectangle")
        schoolView.addSubview(schoolViewBackground)
        schoolViewBackground.layer.shadowColor = UIColor(red: 101/255, green: 63/255, blue: 29/255, alpha: 1).cgColor
        schoolViewBackground.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        schoolViewBackground.layer.shadowOpacity = 1
        schoolViewBackground.layer.shadowRadius = 0
        schoolViewBackground.layer.masksToBounds = false
        schoolViewBackground.snp.makeConstraints { make in
            make.edges.equalTo(schoolView)
        }

        let schoolNameLabel = UILabel()
        schoolNameLabel.text = "Школьное"
        schoolNameLabel.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 24)
        schoolNameLabel.textColor = .white
        schoolNameLabel.textAlignment = .left
        schoolView.addSubview(schoolNameLabel)

        schoolNameLabel.snp.makeConstraints { make in
            make.width.equalTo(162)
            make.height.equalTo(38)
            make.top.equalTo(schoolView).inset(10)
            make.left.equalTo(schoolView).inset(123.1)
        }

        let schoolDescription = UILabel()

        schoolDescription.font = UIFont(name: "YanoneKaffeesatz-Regular", size: 16)
        schoolDescription.textColor = .white
        schoolDescription.textAlignment = .left
        schoolDescription.numberOfLines = 0
        //let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1
        schoolDescription.attributedText = NSMutableAttributedString(string: "Узнай, что выберут одноклассники! Неуд по математике или две двойки по обществу", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])

        schoolView.addSubview(schoolDescription)

        schoolDescription.snp.makeConstraints { make in
            make.width.equalTo(215)
            make.height.equalTo(45)
            make.top.equalTo(schoolView).inset(54)
            make.left.equalTo(schoolView).inset(123.1)
        }


        let schooltasksCount = UILabel()

        schooltasksCount.text = "50 заданий"
        schooltasksCount.font = UIFont(name:  "YanoneKaffeesatz-Regular", size: 14)
        schooltasksCount.textColor = UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        schooltasksCount.textAlignment = .left
        schooltasksCount.numberOfLines = 0

        schoolView.addSubview(schooltasksCount)

        schooltasksCount.snp.makeConstraints { make in
            make.width.equalTo(189)
            make.height.equalTo(38)
            make.top.equalTo(111).inset(111)
            make.left.equalTo(123).inset(123)
        }

        let buyButtonShadowschool = UIImageView()
        buyButtonShadowschool.image = UIImage(named: "buy_shadow")
        schoolView.addSubview(buyButtonShadowschool)
        buyButtonShadowschool.snp.makeConstraints { make in
            make.width.equalTo(92)
            make.height.equalTo(32)
            make.top.equalTo(111)
            make.left.equalTo(236)
        }

        let buyschoolLabel = UILabel()
        buyschoolLabel.text = "КУПИТЬ"
        buyschoolLabel.font = UIFont(name: "YanoneKaffeesatz-Bold", size: 18)
        buyschoolLabel.textColor = .white
        buyschoolLabel.textAlignment = .center
        buyschoolLabel.numberOfLines = 0
        buyschoolLabel.backgroundColor = .clear

        schoolView.addSubview(buyschoolLabel)
        buyschoolLabel.snp.makeConstraints { make in
            make.width.equalTo(107)
            make.height.equalTo(38)
            make.top.equalTo(schoolView).inset(111)
            make.left.equalTo(schoolView).inset(231)
        }


        let schoolButton = UIButton()
        schoolView.addSubview(schoolButton)

        schoolButton.snp.makeConstraints { make in
            make.edges.equalTo(schoolView)
        }


        let schoolIcon = UIImageView()
        schoolIcon.image = UIImage(named: "schoolIcon")
        schoolView.addSubview(schoolIcon)

        schoolIcon.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.top.equalTo(schoolView).inset(20)
            make.left.equalTo(schoolView).inset(13)
        }
        
        cards[0] = superPopularRectangleView
        cards[1] = onMonthView
        cards[2] = trySetView
        cards[3] = cinemaView
        cards[4] = romanticView
        cards[5] = schoolView
   }
}

// MARK: - Configure
extension CatalogViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CatalogCustomCell.identifier, for: indexPath) as! CatalogCustomCell
        cell.selectionStyle = .none
        cell.card = cards[indexPath.row]!
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {return 10}
        else {return 168}
    }
}

// MARK: View Input
extension CatalogViewController {
    func set(title: String) {
        self.title = title
    }
}

// MARK: Button Action
extension CatalogViewController {
    
}



