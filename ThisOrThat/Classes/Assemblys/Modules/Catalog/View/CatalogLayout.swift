//
//  CatalogViewControllerLayout.swift
//  ThisOrThat
//
//  Created by Victor on 28.04.2022.
//

import Foundation
import UIKit
import SnapKit

extension CatalogViewController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutBackgroundImage()
        layoutNavigationBar()
        //layoutBackButton()
        layoutTableView()
    }
    
    fileprivate func layoutBackgroundImage() {
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.snp.makeConstraints {
             $0.edges.equalToSuperview()
        }
    }
    
    fileprivate func layoutNavigationBar() {
        view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints {
             $0.width.equalToSuperview()
             $0.height.equalTo(45)
             $0.centerX.equalToSuperview()
             $0.top.equalToSuperview().inset(20)
        }
        viewTitle.text = "Каталог"
        viewTitle.textColor = .white
        viewTitle.textAlignment = .center
        viewTitle.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 36)
        navigationBar.addSubview(viewTitle)
        viewTitle.snp.makeConstraints {
             $0.width.equalTo(162)
             $0.height.equalTo(39)
             $0.top.equalTo(navigationBar).inset(3)
             $0.centerX.equalTo(navigationBar)
        }
    }
    
    
    fileprivate func layoutTableView() {
        view.addSubview(tableView)
        tableView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        tableView.snp.makeConstraints {
             $0.top.equalTo(navigationBar).inset(65)
             $0.bottom.equalToSuperview().inset(0)
             $0.left.equalToSuperview()
             $0.right.equalToSuperview()
        }
    }
}
