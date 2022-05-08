//
//  ResultsLayout.swift
//  ThisOrThat
//
//  Created by Victor on 07.05.2022.
//

import Foundation
import UIKit

extension ResultsViewController {
    
    func layout () {
        layoutBackground()
        layoutNavigationBar()
        layoutViewTitle()
        layoutTableView()
        layoutEndButtonImage()
        layoutEndLabel()
        layoutEndButton()
    }
    
    fileprivate func layoutBackground() {
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(named: "background")
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func layoutViewTitle() {
        view.addSubview(viewTitle)
        
        viewTitle.text = "Результаты"
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
    }
    
    fileprivate func layoutNavigationBar() {
        view.addSubview(navigationBar)
        
        navigationBar.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(45)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(20)
        }
    }
    
    fileprivate func layoutEndButtonImage() {
        view.addSubview(endButtonImage)
        endButtonImage.image = UIImage(named: "endGame")
        
        
        endButtonImage.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-20)
        }
    }
    
    fileprivate func layoutEndLabel() {
        view.addSubview(endLabel)
        
        endLabel.text = "Закончить"
        endLabel.textColor = .white
        endLabel.textAlignment = .center
        endLabel.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 18)
        
        endLabel.snp.makeConstraints { make in
            make.edges.equalTo(endButtonImage)
        }
        
    }
    
    fileprivate func layoutEndButton() {
        view.addSubview(endButton)
        
        endButton.snp.makeConstraints { make in
            make.edges.equalTo(endButtonImage)
        }
        
    }
    
    fileprivate func layoutTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar).inset(65)
            make.bottom.equalToSuperview().inset(0)
            make.left.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(0)
        }
        
    }
}
