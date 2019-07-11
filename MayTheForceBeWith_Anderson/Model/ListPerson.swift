//
//  ListPerson.swift
//  MayTheForceBeWith_Anderson
//
//  Created by Proaire on 11/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

struct ListPerson: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    var people: [Person]?
    
    enum CodingKeys: String, CodingKey {
        case count, next, previous
        case people = "results"
    }
}
