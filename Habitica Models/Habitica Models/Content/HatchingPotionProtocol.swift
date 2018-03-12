//
//  File.swift
//  Habitica Models
//
//  Created by Phillip Thelen on 12.03.18.
//  Copyright © 2018 HabitRPG Inc. All rights reserved.
//

import Foundation

public protocol HatchingPotionProtocol: ItemProtocol {
    var premium: Bool { get set }
    var limited: Bool { get set }
}
