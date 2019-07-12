//
//  Model.swift
//  firestoreTest
//
//  Created by Boshi on 2019/7/12.
//  Copyright © 2019 Boshi. All rights reserved.
//

import Foundation

struct Student: Decodable {
    let passClass: Int
    
    init() {
        self.passClass = 0
    }
}
