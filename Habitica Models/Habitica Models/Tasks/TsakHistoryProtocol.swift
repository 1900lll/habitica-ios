//
//  TsakHistoryProtocol.swift
//  Habitica Models
//
//  Created by Phillip Thelen on 24.09.19.
//  Copyright © 2019 HabitRPG Inc. All rights reserved.
//

import Foundation

@objc

public protocol TaskHistoryProtocol: BaseModelProtocol {
    var taskID: String? { get set }
    var timestamp: Date? { get set }
    var value: Float { get set }
    var scoredUp: Bool { get set }
    var scoredDown: Bool { get set }
}
