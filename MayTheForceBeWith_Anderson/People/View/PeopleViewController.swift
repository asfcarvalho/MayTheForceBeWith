//
//  PeopleViewController.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Anderson F Carvalho on 11/07/19.
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
        peopleView?.viewController = self
        self.view = (peopleView as? UIView) ?? UIView()
        
        view.accessibilityIdentifier = "personView"
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
        Loading.showLoading(self.view)
    }
    
    func stopLoading() {
        Loading.stopLoading()
    }
    
    
}
