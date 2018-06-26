//
//  APIEgg.swift
//  Habitica API Client
//
//  Created by Phillip Thelen on 12.03.18.
//  Copyright © 2018 HabitRPG Inc. All rights reserved.
//

import Foundation
import Habitica_Models

class APIEgg: EggProtocol, Codable {
    var isSubscriberItem: Bool = false
    var key: String?
    var text: String?
    var notes: String?
    var value: Float = 0
    var adjective: String?
    var itemType: String?
    
    enum CodingKeys: String, CodingKey {
        case key
        case text
        case notes
        case value
        case adjective
        case itemType
    }
}
