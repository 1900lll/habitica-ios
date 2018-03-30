//
//  UpdateTask.swift
//  Habitica API Client
//
//  Created by Phillip Thelen on 26.03.18.
//  Copyright © 2018 HabitRPG Inc. All rights reserved.
//

import Foundation
import Habitica_Models
import FunkyNetwork


public class UpdateTaskCall: ResponseObjectCall<TaskProtocol, APITask> {
    public init(task: TaskProtocol, stubHolder: StubHolderProtocol? = StubHolder(responseCode: 200, stubFileName: "tasks.json")) {
        let json = try? JSONEncoder().encode(APITask(task))
        super.init(httpMethod: .PUT, endpoint: "tasks/\(task.id ?? "")", postData: json, stubHolder: stubHolder)
    }
}
