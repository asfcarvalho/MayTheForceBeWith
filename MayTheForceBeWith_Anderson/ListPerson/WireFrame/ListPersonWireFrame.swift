//
//  ListPersonWireFrame.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Proaire on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class ListPersonWireFrame: ListPersonWireFrameProtocol {
    
    class func createViewController() -> UIViewController {
        
        var presenter: ListPersonPresenterProtocol & ListPersonDataManagerOutputProtocol = ListPersonPresenter()
        var dataManager: ListPersonDataManagerInputProtocol = ListPersonDataManager()
        let wireFrame: ListPersonWireFrameProtocol = ListPersonWireFrame()
        
        let viewController = ListPersonViewController(nibName: nil, bundle: nil)
        viewController.presenter = presenter
        presenter.dataManager = dataManager
        dataManager.presenter = presenter
        presenter.viewController = viewController
        presenter.wireFrame = wireFrame
        
        
        return viewController
    }
    
    func showAlert(_ viewController: ListPersonViewControllerPortocol?, _ message: String) {
        
        guard let viewController = viewController as? UIViewController else { return }
        
        UIAlertCustom.shared.showAlert(from: viewController, message: message)
        
    }
    
    
    func showPeople(from viewController: ListPersonViewControllerPortocol?, person: Person?) {
        
        
        let person = PeopleWireFrame.createViewController(person)
        
        if let vc = viewController as? UIViewController {
            vc.navigationController?.pushViewController(person, animated: true)
            
        }
    }
}
