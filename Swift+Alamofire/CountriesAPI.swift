//
//  CountriesAPI.swift
//  Swift+Alamofire
//
//  Created by Caio Sanchez Christino on 30/11/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import Foundation
import RxSwift

enum CountriesAPI {
    case Name(name: String)
    case AlphaCodes(codes: [String])
}

extension CountriesAPI: Resource {
    var path: String {
        switch self {
        case let .Name(name):
            return "name/\(name)"
        case .AlphaCodes:
            return "alpha"
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .Name:
            return ["fullText": "true"]
        case let .AlphaCodes(codes):
            return ["codes": codes.joined(separator: ";")]
        }
    }
}

extension NSURL {
    class func countriesURL() -> NSURL {
        return NSURL(string: "https://restcountries.eu/rest/v1")!
    }
}

extension APIClient {
    class func countriesAPIClient() -> APIClient {
        return APIClient(baseURL: NSURL.countriesURL())
    }
    
    func countryWithName(name: String) -> Observable<Country> {
        return objects(resource: CountriesAPI.Name(name: name)).map { $0[0] }
    }
    
    func countriesWithCodes(codes: [String]) -> Observable<[Country]> {
        return objects(resource: CountriesAPI.AlphaCodes(codes: codes))
    }
}
