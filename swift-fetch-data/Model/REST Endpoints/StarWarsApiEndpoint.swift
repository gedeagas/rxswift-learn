//
//  StarWarsApiEndpoint.swift
//  swift-fetch-data
//
//  Created by Agastya Darma on 08/11/17.
//  Copyright © 2017 Agastya Darma. All rights reserved.
//

import Foundation
import Moya

enum StarwarsApi {
    case fetchAllPeople
}


extension StarwarsApi: TargetType{
    var baseURL: URL {
        return URL(string: "https://swapi.co/api")!
    }
    
    var path: String {
        switch self {
        case .fetchAllPeople:
            return "/people"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchAllPeople:
            return .get
        }
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .fetchAllPeople:
            return Task.requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
