//
//  ListPerson.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Anderson F Carvalho on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

struct ListPerson: Codable {
    let count: Int?
    var next: String?
    let previous: String?
    var people: [Person]?
    
    enum CodingKeys: String, CodingKey {
        case count, next, previous
        case people = "results"
    }
}

