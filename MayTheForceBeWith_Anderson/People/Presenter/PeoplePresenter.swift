//
//  PeoplePresenter.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Proaire on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class PeoplePresenter: PeoplePresenterProtocol {
    
    var wireFrame: PeopleDataManagerInputProtocol?
    var viewController: PeopleViewControllerProtocol?
    
    func setFavorite() {
        viewController?.showLoading()
        wireFrame?.favoriteFetch()
    }
}

extension PeoplePresenter: PeopleDataManagerOutputProtocol {
    func onSuccess() {
        viewController?.showLoading()
        viewController?.onFavorite()
    }
    
    func onError(_ message: String) {
        viewController?.stopLoading()
        
    }
    
    
}
