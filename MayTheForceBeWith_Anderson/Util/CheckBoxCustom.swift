//
//  CheckBoxCustom.swift
//  GenBit
//
//  Created by Anderson F Carvalho on 05/07/19.
//  Copyright © 2019 Treepart. All rights reserved.
//

import UIKit

class CheckBox: UIView {
    
    var isChecked = false
    
    init() {
        super.init(frame: CGRect.zero)
        
        configView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configView() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 3
        self.backgroundColor = UIColor.white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(checkBoxAction))
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
    }
    
    @objc fileprivate func checkBoxAction() {
        
        isChecked.toggle()
        self.backgroundColor = isChecked ? UIColor.lightGray : UIColor.white
    }
}
