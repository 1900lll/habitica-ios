//
//  APITag.swift
//  Habitica API Client
//
//  Created by Phillip Thelen on 06.03.18.
//  Copyright © 2018 HabitRPG Inc. All rights reserved.
//

import Foundation
import Habitica_Models

class APITag: TagProtocol, Codable {
    var id: String?
    var text: String?
    var order: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case id
        case text = "name"
    }
    
    init(_ id: String) {
        self.id = id
    }
}
