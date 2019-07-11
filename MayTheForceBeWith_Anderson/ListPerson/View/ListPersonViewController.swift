//
//  ListPersonViewController.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Proaire on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class ListPersonViewController: UIViewController {
    
    var presenter: ListPersonPresenterProtocol?
    var listPersonView: ListPersonViewProtocol?
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("People", comment: "")
        
        listPersonView = ListPersonView(frame: self.view.frame)
        listPersonView?.viewController = self
        self.view = (listPersonView as? UIView) ?? UIView()
        
        presenter?.getListPerson(1)
    }
    
    func getNewPage() {
        page += 1
        presenter?.getListPerson(page)
    }
}

extension ListPersonViewController: ListPersonViewControllerPortocol {
    func showError(_ message: String) {
        presenter?.showAlert(message)
    }
    
    
    func showPeople(_ people: ListPerson?) {
        listPersonView?.showPeople(people)
    }
    
    func onLoading() {
        Loading.shared.showLoading(self.view)
    }
    
    func stopLoading() {
        Loading.shared.stopLoading()
    }
    
    
}
