//
//  PeopleDataManager.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Anderson F Carvalho on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class PeopleDataManager: PeopleDataManagerInputProtocol {
    weak var presenter: PeopleDataManagerOutputProtocol?
    
    
    func favoriteFetch() {
        guard let url = URL(string: "http://webhook.site/4d87d1ad-24aa-4ec0-8839-bfdac4670d41") else {

            presenter?.onError(NSLocalizedString("URLError", comment: ""))
            return

        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { (data, _, error) in

            guard let data = data, error == nil else {
                self.presenter?.onError(error?.localizedDescription ?? "")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                
                let favorite = try jsonDecoder.decode(Favorite.self, from: data)
                
                if favorite.status == true {
                    self.presenter?.onSuccess()
                }else {
                    self.presenter?.onError("")
                }
                
                
            }catch let jsonError {
                self.presenter?.onError(jsonError.localizedDescription)
            }
                
            }.resume()
    }
}
