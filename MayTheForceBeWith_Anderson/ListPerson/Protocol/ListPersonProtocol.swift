//
//  ListPersonProtocol.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Proaire on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

protocol ListPersonViewControllerPortocol {
    
    var listPersonView: ListPersonViewProtocol? { get set }
    var presenter: ListPersonPresenterProtocol? { get set }
    
    func showPeople(_ people: ListPerson?)
    func showError(_ message: String)
    func getNewPage(_ page: String?)
    func openPeople(_ person: Person?)
    func onLoading()
    func stopLoading()
}

protocol ListPersonViewProtocol {
    
    var viewController: ListPersonViewControllerPortocol? { get set }
    
    func showPeople(_ people: ListPerson?)
}

protocol ListPersonWireFrameProtocol {
    
    static func createViewController() -> UIViewController
    
    func showAlert(_ viewController: ListPersonViewControllerPortocol?, _ message: String)
    func showPeople(from viewController: ListPersonViewControllerPortocol?, person: Person?)
}

protocol ListPersonPresenterProtocol {
    
    var viewController: ListPersonViewControllerPortocol? { get set }
    var dataManager: ListPersonDataManagerInputProtocol? { get set }
    var wireFrame: ListPersonWireFrameProtocol? { get set }
    
    func getListPerson(_ page: String?)
    func showAlert(_ message: String)
    func openPeople(_ person: Person?)
}

protocol ListPersonDataManagerInputProtocol {
    
    var presenter: ListPersonDataManagerOutputProtocol? { get set }
    
    func peopleFetch(_ page: String?)
}

protocol ListPersonDataManagerOutputProtocol: class {
    
    func onSuccess(_ people: ListPerson?)
    func onError(_ message: String)
    
}
