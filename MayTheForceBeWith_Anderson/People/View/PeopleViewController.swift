//
//  PeopleViewController.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Proaire on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {
    
    var presenter: PeoplePresenterProtocol?
    var peopleView: PeopleViewProtocol?
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("Person", comment: "")
        
        peopleView = PeopleView(frame: self.view.frame)
        peopleView?.setupView(person)
        self.view = (peopleView as? UIView) ?? UIView()
    }
    
    func setFavorite() {
        presenter?.setFavorite()
    }
}

extension PeopleViewController: PeopleViewControllerProtocol {
    func onFavorite() {
        peopleView?.onFavorite()
    }
    
    func showLoading() {
        Loading.shared.showLoading(self.view)
    }
    
    func stopLoading() {
        Loading.shared.stopLoading()
    }
    
    
}
