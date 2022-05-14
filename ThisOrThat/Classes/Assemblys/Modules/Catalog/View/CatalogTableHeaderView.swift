//
//  CatalogTableFooterView.swift
//  ThisOrThat
//
//  Created by Victor on 13.05.2022.
//

import Foundation
import UIKit

class CatalogTableHeaderVIew: UIView {
    
    let header = UIImageView()
    let superPopularText = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layout()
    }
    func layout() {
        frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 36)
        addSubview(header)
        header.image = UIImage(named: "superPopularRect")
        
        header.snp.makeConstraints { make in
            make.width.equalTo(239)
            make.height.equalTo(36)
            make.centerX.equalToSuperview()
        }
        
        superPopularText.text = "СУПЕР ПОПУЛЯРНО"
        superPopularText.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.32)
        superPopularText.textAlignment = .center
        superPopularText.font = UIFont(name: "YanoneKaffeesatz-Bold" , size: 18)
        
        addSubview(superPopularText)
        superPopularText.snp.makeConstraints { make in
            make.width.equalTo(239)
            make.height.equalTo(36)
            make.top.equalToSuperview().inset(3)
            make.centerX.equalToSuperview()
            
        }
    }
}
