//
//  PeopleView.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Anderson F Carvalho on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class PeopleView: UIView {
    
    var person: Person?
    var viewController: PeopleViewControllerProtocol?
    
    let nameLabel = UILabelCustom()
    let heightLabel = UILabelCustom()
    let massLabel = UILabelCustom()
    let birthYearLabel = UILabelCustom()
    
    let favoriteImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.tintColor = UIColor.gray
        return imageView
    }()
    let favoriteLabel = UILabelCustom()
    
    let scrollView: UIScrollView = {
       let scroll = UIScrollView()
        
        return scroll
    }()
    
    let safeView = UIView()
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    let favoriteView = UIView()
    
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
        heightLabel.text = NSLocalizedString("Height", comment: "") + ": "
        massLabel.text = NSLocalizedString("Mass", comment: "") + ": "
        birthYearLabel.text = NSLocalizedString("BirthYear", comment: "") + ": "
        favoriteLabel.text = NSLocalizedString("Favorite", comment: "")
        
        let tapFavorite = UITapGestureRecognizer(target: self, action: #selector(favoriteAction))
        favoriteView.addGestureRecognizer(tapFavorite)
        favoriteView.isUserInteractionEnabled = true
        
        self.addSubview(scrollView)
        self.scrollView.addSubview(safeView)
        self.safeView.addSubview(lineView)
        self.safeView.addSubview(favoriteView)
        self.favoriteView.addSubview(favoriteLabel)
        self.favoriteView.addSubview(favoriteImage)
        self.safeView.addSubview(nameLabel)
        self.safeView.addSubview(heightLabel)
        self.safeView.addSubview(massLabel)
        self.safeView.addSubview(birthYearLabel)
        
        
        
        scrollView.fillSuperview()
        safeView.anchor(top: scrollView.topAnchor, leading: self.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: self.trailingAnchor)
        
        favoriteView.anchor(top: safeView.topAnchor, leading: safeView.leadingAnchor, bottom: nil, trailing: safeView.trailingAnchor)
        
        favoriteLabel.anchor(top: favoriteView.topAnchor, leading: nil, bottom: favoriteView.bottomAnchor, trailing: favoriteView.trailingAnchor, padding: UIEdgeInsets(top: 16, left: 8, bottom: 0, right: 16))
        
        favoriteImage.anchor(top: nil, leading: favoriteView.leadingAnchor, bottom: nil, trailing: favoriteLabel.leadingAnchor, centerY: favoriteLabel.centerYAnchor, padding: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 0), size: CGSize(width: 25, height: 25))
        
        lineView.anchor(top: favoriteView.bottomAnchor, leading: favoriteView.leadingAnchor, bottom: nil, trailing: favoriteView.trailingAnchor, padding: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8), size: CGSize(width: 0, height: 1))
        
        nameLabel.anchor(top: favoriteLabel.bottomAnchor, leading: safeView.leadingAnchor, bottom: nil, trailing: safeView.trailingAnchor, padding: UIEdgeInsets(top: 32, left: 16, bottom: 0, right: 0))
        heightLabel.anchor(top: nameLabel.bottomAnchor, leading: nameLabel.leadingAnchor, bottom: nil, trailing: nameLabel.trailingAnchor, padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
        massLabel.anchor(top: heightLabel.bottomAnchor, leading: heightLabel.leadingAnchor, bottom: nil, trailing: heightLabel.trailingAnchor, padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
        birthYearLabel.anchor(top: massLabel.bottomAnchor, leading: massLabel.leadingAnchor, bottom: safeView.bottomAnchor, trailing: massLabel.trailingAnchor, padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
        
    }
    
    func setupView(_ person: Person?) {
        self.person = person
        nameLabel.text = (nameLabel.text ?? "") + (person?.name ?? "")
        heightLabel.text = (heightLabel.text ?? "") + (person?.height ?? "")
        massLabel.text = (massLabel.text ?? "") + (person?.mass ?? "")
        birthYearLabel.text = (birthYearLabel.text ?? "") + (person?.birthYear ?? "")
    }
    
    @objc func favoriteAction() {
        viewController?.setFavorite()
    }
}

extension PeopleView: PeopleViewProtocol {
    func onFavorite() {
        self.accessibilityIdentifier = "favoriting"
        DispatchQueue.main.async {
            if self.person?.isFavorite == true {
                self.person?.isFavorite = false
            }else {
                self.person?.isFavorite = true
            }
            
            self.favoriteImage.tintColor = self.person?.isFavorite == true ? UIColor.yellow : UIColor.gray
            
        }
        
    }
}
