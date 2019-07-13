//
//  UILabel+custom.swift
//  GenBit
//
//  Created by Anderson F Carvalho on 01/07/19.
//  Copyright © 2019 Treepart. All rights reserved.
//

import UIKit

class UILabelCustom: UILabel {
    
    init() {
        super.init(frame: CGRect.zero)
        
        setupLabel()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupLabel() {
        
    }
    
    func setAction(target: Any?, action: Selector?, textAlignment: NSTextAlignment = .center) {
        
        self.textColor = UIColor.blue
        
        self.textAlignment = textAlignment
        
        let tap = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
    }
}
