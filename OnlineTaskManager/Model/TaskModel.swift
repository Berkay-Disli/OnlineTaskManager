//
//  TaskModel.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 14.05.2022.
//

import Foundation

struct Task: Identifiable {
    let id = UUID().uuidString
    let name: String
    let creator: String
    let members: [String]
    let steps: [TaskStep]
}



struct TaskStep: Identifiable {
    let id = UUID().uuidString
    let stepName: String
}
