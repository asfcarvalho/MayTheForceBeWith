//
//  PeopleProtocol.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Anderson F Carvalho on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

protocol PeopleViewControllerProtocol {
    var person: Person? { get set }
    var peopleView: PeopleViewProtocol? { get set }
    var presenter: PeoplePresenterProtocol? { get set }
    
    func onFavorite()
    func setFavorite()
    func showLoading()
    func stopLoading()
}

protocol PeopleViewProtocol {
    
    var viewController: PeopleViewControllerProtocol? {  get set }
    
    func setupView(_ person: Person?)
    
    func onFavorite()
}

protocol PeopleWireFrameProtocol {
    
    static func createViewController(_ person: Person?) -> UIViewController
    
}


protocol PeopleDataManagerInputProtocol {
    
    var presenter: PeopleDataManagerOutputProtocol? { get set }
    
    func favoriteFetch()
    
}

protocol PeopleDataManagerOutputProtocol: class {
    func onSuccess()
    func onError(_ message: String)
}

protocol PeoplePresenterProtocol {
    
    var wireFrame: PeopleWireFrameProtocol? { get set }
    var dataManager: PeopleDataManagerInputProtocol? { get set }
    var viewController: PeopleViewControllerProtocol? { get set }
    
    func setFavorite()
    
}
