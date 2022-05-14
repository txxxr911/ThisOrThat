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
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
    }
    
    
    fileprivate func layoutTableView() {
        view.addSubview(tableView)
        tableView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar).inset(65)
            make.bottom.equalToSuperview().inset(0)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}
