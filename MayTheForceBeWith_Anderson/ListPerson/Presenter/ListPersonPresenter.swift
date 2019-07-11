//
//  ListPersonPresenter.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Proaire on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class ListPersonPresenter: ListPersonPresenterProtocol {

    
    var viewController: ListPersonViewControllerPortocol?
    var dataManager: ListPersonDataManagerInputProtocol?
    var wireFrame: ListPersonWireFrameProtocol?
    
    func getListPerson(_ page: Int) {
        viewController?.onLoading()
        dataManager?.peopleFetch(page)
    }
    
    func showAlert(_ message: String) {
        wireFrame?.showAlert(viewController, message)
    }
}

extension ListPersonPresenter: ListPersonDataManagerOutputProtocol {
    func onSuccess(_ people: ListPerson?) {
        viewController?.showPeople(people)
        viewController?.stopLoading()
    }
    
    func onError(_ message: String) {
        viewController?.stopLoading()
        viewController?.showError(message)
    }
    

}
