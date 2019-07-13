//
//  ListPersonViewController.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Anderson F Carvalho on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class ListPersonViewController: UIViewController {
    
    var presenter: ListPersonPresenterProtocol?
    var listPersonView: ListPersonViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("People", comment: "")
        
        listPersonView = ListPersonView(frame: self.view.frame)
        listPersonView?.viewController = self
        self.view = (listPersonView as? UIView) ?? UIView()
        
        presenter?.getListPerson(nil)
        
        view.accessibilityIdentifier = "listPersonView"
    }
    
    func getNewPage(_ page: String?) {
        presenter?.getListPerson(page)
    }
}

extension ListPersonViewController: ListPersonViewControllerPortocol {
    func openPeople(_ person: Person?) {
        presenter?.openPeople(person)
    }
    
    func showError(_ message: String) {
        presenter?.showAlert(message)
    }
    
    
    func showPeople(_ people: ListPerson?) {
        listPersonView?.showPeople(people)
    }
    
    func onLoading() {
        Loading.showLoading(self.view)
    }
    
    func stopLoading() {
        Loading.stopLoading()
    }
    
    
}
