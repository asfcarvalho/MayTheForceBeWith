//
//  PeopleWireFrame.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Anderson F Carvalho on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class PeopleWireFrame: PeopleWireFrameProtocol {
    class func createViewController(_ person: Person?) -> UIViewController {
        
        var presenter: PeoplePresenterProtocol & PeopleDataManagerOutputProtocol = PeoplePresenter()
        let wireFrame: PeopleWireFrameProtocol = PeopleWireFrame()
        var dataManager: PeopleDataManagerInputProtocol = PeopleDataManager()
        
        let viewController = PeopleViewController(nibName: nil, bundle: nil)
        viewController.person = person
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.wireFrame = wireFrame
        presenter.dataManager = dataManager
        dataManager.presenter = presenter
        
//        viewController.
        
        return viewController
    }
    
    
}
