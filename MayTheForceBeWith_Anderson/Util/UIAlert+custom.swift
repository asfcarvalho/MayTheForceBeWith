//
//  UIAlert+custom.swift
//  GenBit
//
//  Created by Anderson F Carvalho on 01/07/19.
//  Copyright © 2019 Treepart. All rights reserved.
//

import UIKit

struct ButtonType {
    let alertEnum: String?
    let handler: ((UIAlertAction) -> Void)?
}

class UIAlertCustom: NSObject {
    
    static var shared = UIAlertCustom()
    
    func showAlert(from viewController: UIViewController, title: String? = nil, message: String, buttonType: [ButtonType]? = nil) {
        let title = title ?? NSLocalizedString("Attention", comment: "")
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        
        if let buttonType = buttonType {
            for type in buttonType {
                let title = type.alertEnum
                alert.addAction(UIAlertAction(title: title, style: UIAlertAction.Style.default, handler: type.handler))
            }
        }else {
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: UIAlertAction.Style.cancel, handler: nil))
        }

        viewController.present(alert, animated: true, completion: nil)
    }
}
