//
//  TaskViewModel.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 14.05.2022.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks = [Task]()
    @Published var steps = [TaskStep]()
    
    init() {
        
    }
    
    
    func createTask(taskName: String, creator: String, members: [String]) {
        let taskToCreate = Task(name: taskName, creator: creator, members: members, steps: steps)
        tasks.append(taskToCreate)
    }
    
    func createStep(name: String) {
        let stepToAdd = TaskStep(stepName: name)
        steps.append(stepToAdd)
    }
}
