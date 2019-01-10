//
//  PurchaseNoRenewSubscriptionCall.swift
//  Habitica API Client
//
//  Created by Phillip Thelen on 14.12.18.
//  Copyright © 2018 HabitRPG Inc. All rights reserved.
//

import Foundation
import Habitica_Models
import FunkyNetwork
import ReactiveSwift

public class PurchaseNoRenewSubscriptionCall: ResponseObjectCall<EmptyResponseProtocol, APIEmptyResponse> {
    public init(receipt: [String: Any], recipient: String?, stubHolder: StubHolderProtocol? = StubHolder(responseCode: 200, stubFileName: "user.json")) {
        var data = ["transaction": receipt]
        if let recipient = recipient {
            data["gift"] = ["uuid": recipient]
        }
        let json = try? JSONSerialization.data(withJSONObject: data, options: [])
        super.init(httpMethod: .POST, endpoint: "iap/ios/norenew-subscribe", postData: json, stubHolder: stubHolder, errorHandler: PrintNetworkErrorHandler())
    }
}
