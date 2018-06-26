//
//  OpenMysteryItemCall.swift
//  Habitica API Client
//
//  Created by Phillip Thelen on 13.04.18.
//  Copyright © 2018 HabitRPG Inc. All rights reserved.
//

import Foundation
import Habitica_Models
import FunkyNetwork
import ReactiveSwift

public class OpenMysteryItemCall: ResponseObjectCall<EmptyResponseProtocol, APIEmptyResponse> {
    public init(stubHolder: StubHolderProtocol? = StubHolder(responseCode: 200, stubFileName: "user.json")) {
        super.init(httpMethod: .POST, endpoint: "user/open-mystery-item", postData: nil, stubHolder: stubHolder)
    }
}
