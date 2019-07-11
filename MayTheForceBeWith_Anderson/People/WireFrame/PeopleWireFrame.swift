//
//  PeopleWireFrame.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Proaire on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class PeopleWireFrame: PeopleWireFrameProtocol {
    class func createViewController(_ person: Person?) -> UIViewController {
        
        let viewController = PeopleViewController(nibName: nil, bundle: nil)
        viewController.person = person
        
//        viewController.
        
        return viewController
    }
    
    
}
