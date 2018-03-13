//
//  QuestProtocol.swift
//  Habitica Models
//
//  Created by Phillip Thelen on 12.03.18.
//  Copyright © 2018 HabitRPG Inc. All rights reserved.
//

import Foundation

@objc
public protocol QuestProtocol: ItemProtocol {
    var completion: String? { get set }
    var category: String? { get set }
    var boss: QuestBossProtocol? { get set }
    var collect: [QuestCollectProtocol]? { get set }
}
