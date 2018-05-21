//
//  RetrieveShopInventoryCall.swift
//  Habitica API Client
//
//  Created by Phillip Thelen on 21.05.18.
//  Copyright © 2018 HabitRPG Inc. All rights reserved.
//

import Foundation
import Habitica_Models
import FunkyNetwork
import ReactiveSwift

public class RetrieveShopInventoryCall: ResponseObjectCall<EmptyResponseProtocol, APIEmptyResponse> {
    public init(identifier: String, stubHolder: StubHolderProtocol? = StubHolder(responseCode: 200, stubFileName: "user.json")) {
        super.init(httpMethod: .POST, endpoint: "shops/\(identifier)", postData: nil, stubHolder: stubHolder)
    }
}
