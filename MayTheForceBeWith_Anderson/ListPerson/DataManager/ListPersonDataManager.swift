//
//  ListPersonDataManager.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Anderson F Carvalho on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class ListPersonDataManager: ListPersonDataManagerInputProtocol {
    weak var presenter: ListPersonDataManagerOutputProtocol?
    
    func peopleFetch(_ page: String?) {
        
        guard let url = URL(string: page ?? "https://swapi.co/api/people/?page=1") else {
            
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
               let people = try jsonDecoder.decode(ListPerson.self, from: data)
                
                self.presenter?.onSuccess(people)
            }catch let jsonError {
                self.presenter?.onError(jsonError.localizedDescription)
            }
            
        }.resume()
        
    }
    
    
}
