//
//  Country.swift
//  Swift+Alamofire
//
//  Created by Caio Sanchez Christino on 30/11/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation

struct Country {
    let name: String
    let nativeName: String
    let borders: [String]
}

extension Country: JSONDecodable {
    init?(dictionary: JSONDictionary) {
        guard let name = dictionary["name"] as? String,
            let nativeName = dictionary["nativeName"] as? String else {
                return nil
        }
        
        self.name = name
        self.nativeName = nativeName
        self.borders = dictionary["borders"] as? [String] ?? []
    }
}

