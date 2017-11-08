//
//  PeopleResponse.swift
//  swift-fetch-data
//
//  Created by Agastya Darma on 08/11/17.
//  Copyright © 2017 Agastya Darma. All rights reserved.
//

import Foundation
import Unbox

struct PeopleResponse {
    var name: String = ""
    var height: Int = 0
    var mass: Int = 0
}


extension PeopleResponse: Unboxable{
    init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
        self.height = try unboxer.unbox(key: "height")
        self.mass = try unboxer.unbox(key: "mass")
    }
}
