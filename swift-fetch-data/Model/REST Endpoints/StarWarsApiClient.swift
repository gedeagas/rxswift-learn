//
//  StarWarsApiClient.swift
//  swift-fetch-data
//
//  Created by Agastya Darma on 08/11/17.
//  Copyright © 2017 Agastya Darma. All rights reserved.
//

import Foundation
import Unbox
import Moya
import RxSwift

struct StarWarsApiClient {
    let provider = MoyaProvider<StarwarsApi>()
    
    func fetchAllPeople() -> Observable<AllPeopleResponse?>{
        return provider
            .rx
            .request(.fetchAllPeople)
            .mapJSON()
            .map({ json -> AllPeopleResponse? in
                guard let dictJson = json as? [String:Any] else {
                    return nil
                }
            
                let res: AllPeopleResponse = try unbox(dictionary: dictJson)
                
                return res
            })
            .retry(3)
            .asObservable()
        
    }
}
