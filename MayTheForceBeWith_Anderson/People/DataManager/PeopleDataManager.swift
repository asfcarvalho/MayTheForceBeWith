//
//  PeopleDataManager.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Proaire on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class PeopleDataManager: PeopleDataManagerInputProtocol {
    var presenter: PeopleDataManagerOutputProtocol?
    
    
    func favoriteFetch() {
        guard let url = URL(string: "http://webhook.site/47031eaa-0132-41cb-b910-0eb4cbf7c218") else {

            presenter?.onError(NSLocalizedString("URLError", comment: ""))
            return

        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { (data, _, error) in

            guard let _ = data, error == nil else {
                self.presenter?.onError(error?.localizedDescription ?? "")
                return
            }

            self.presenter?.onSuccess()

            }.resume()
    }
}
