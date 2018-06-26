//
//  RealmItem.swift
//  Habitica Database
//
//  Created by Phillip Thelen on 13.03.18.
//  Copyright © 2018 HabitRPG Inc. All rights reserved.
//

import Foundation
import Habitica_Models
import RealmSwift

class RealmItem: Object, ItemProtocol {
    @objc dynamic var key: String?
    @objc dynamic var text: String?
    @objc dynamic var notes: String?
    @objc dynamic var value: Float = 0
    @objc dynamic var itemType: String?
    @objc dynamic var isSubscriberItem: Bool = false
    
    override static func primaryKey() -> String {
        return "key"
    }
    
    convenience init(item: ItemProtocol) {
        self.init()
        key = item.key
        text = item.text
        notes = item.notes
        value = item.value
        isSubscriberItem = item.isSubscriberItem
    }
}
