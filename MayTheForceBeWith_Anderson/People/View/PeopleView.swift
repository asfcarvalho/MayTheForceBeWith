//
//  PeopleView.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Proaire on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class PeopleView: UIView {
    
    let nameLabel = UILabelCustom()
    let favoriteBox = CheckBox()
    let favoriteLabel = UILabelCustom()
    
    let scrollView: UIScrollView = {
       let scroll = UIScrollView()
        
        return scroll
    }()
    
    let safeView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configView() {
        
        self.backgroundColor = UIColor.white
        
        nameLabel.text = NSLocalizedString("Name", comment: "") + ": "
        favoriteLabel.text = NSLocalizedString("Favorite", comment: "")
        
        self.addSubview(scrollView)
        self.scrollView.addSubview(safeView)
        self.safeView.addSubview(favoriteBox)
        self.safeView.addSubview(nameLabel)
        
        
        
        scrollView.fillSuperview()
        safeView.anchor(top: scrollView.topAnchor, leading: self.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: self.trailingAnchor)
        
        
        favoriteLabel.anchor(top: safeView.topAnchor, leading: nil, bottom: nil, trailing: safeView.trailingAnchor, padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 16))
        
        favoriteBox.anchor(top: nil, leading: safeView.leadingAnchor, bottom: nil, trailing: nil, centerY: favoriteLabel.centerYAnchor, padding: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 0), size: CGSize(width: 15, height: 15))
        
        nameLabel.anchor(top: favoriteLabel.topAnchor, leading: safeView.leadingAnchor, bottom: safeView.bottomAnchor, trailing: safeView.trailingAnchor, padding: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 0))
        
//        nameLabel
    }
    
    func setupView(_ person: Person?) {
        nameLabel.text = (nameLabel.text ?? "") + (person?.name ?? "")
    }
}

extension PeopleView: PeopleViewProtocol {
    func onFavorite() {
        
    }
}
