//
//  CreateTaskCall.swift
//  Habitica API Client
//
//  Created by Phillip Thelen on 26.03.18.
//  Copyright © 2018 HabitRPG Inc. All rights reserved.
//

import Foundation
import Habitica_Models
import FunkyNetwork


public class CreateTaskCall: ResponseObjectCall<TaskProtocol, APITask> {
    public init(task: TaskProtocol, stubHolder: StubHolderProtocol? = StubHolder(responseCode: 200, stubFileName: "tasks.json")) {
        let json = try? JSONEncoder().encode(APITask(task))
        print(try? JSONSerialization.jsonObject(with: json!, options: []))
        super.init(httpMethod: .POST, endpoint: "tasks/user", postData: json, stubHolder: stubHolder)
    }
}
