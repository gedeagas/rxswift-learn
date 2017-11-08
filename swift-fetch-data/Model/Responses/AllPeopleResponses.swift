//
//  AllPeopleResponses.swift
//  swift-fetch-data
//
//  Created by Agastya Darma on 08/11/17.
//  Copyright © 2017 Agastya Darma. All rights reserved.
//

import Foundation
import Unbox

struct AllPeopleResponse {
    var peoples: [PeopleResponse] = []
}

extension AllPeopleResponse: Unboxable {
    init(unboxer: Unboxer) throws {
        self.peoples = try unboxer.unbox(key: "results")
    }
}

