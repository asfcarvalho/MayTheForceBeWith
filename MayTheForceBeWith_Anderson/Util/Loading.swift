//
//  Loading.swift
//  FrameworkSample
//
//  Created by Anderson Carvalho on 11/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class Loading {
    
//    static var shared = Loading()
    
    fileprivate static var viewLoading: UIView?
    
    static func showLoading(_ view: UIView) {
        
        stopLoading()
        
        viewLoading = UIView(frame: view.bounds)
        viewLoading?.backgroundColor = UIColor.gray.withAlphaComponent(0.9)
        
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.center = view.center
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        
        DispatchQueue.main.async {
            self.viewLoading?.addSubview(indicator)
            guard let value = self.viewLoading else { return }
            view.addSubview(value)
        }
        
    }
    
    static func stopLoading() {
        DispatchQueue.main.async {
            self.viewLoading?.removeFromSuperview()
        }
    }
}
