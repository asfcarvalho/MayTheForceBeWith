//
//  PeoplePresenter.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Anderson F Carvalho on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class PeoplePresenter: PeoplePresenterProtocol {
    
    var wireFrame: PeopleWireFrameProtocol?
    var dataManager: PeopleDataManagerInputProtocol?
    var viewController: PeopleViewControllerProtocol?
    
    func setFavorite() {
        viewController?.showLoading()
        dataManager?.favoriteFetch()
    }
}

extension PeoplePresenter: PeopleDataManagerOutputProtocol {
    func onSuccess() {
        viewController?.stopLoading()
        viewController?.onFavorite()
    }
    
    func onError(_ message: String) {
        viewController?.stopLoading()
        
    }
    
    
}
