//
//  TaskViewModel.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 14.05.2022.
//

import Foundation
import Firebase

class TaskViewModel: ObservableObject {
    @Published var tasks = [Task]()
    @Published var steps = [TaskStep]()
    @Published var myTasks = [Task]()
    
    // firestore
    private var stepArray = [String]()
    
    init() {
        
    }
    
    
    func createTask(taskName: String, creator: String, members: [String]) {
        let taskToCreate = Task(name: taskName, creator: creator, members: members, steps: steps)
        tasks.append(taskToCreate)
        
        // Firestore
        let data: [String:Any] = ["steps": stepArray, "creator": creator, "assigned_to": members]
        
        Firestore.firestore().collection("tasks").document(taskToCreate.id).setData(data) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("SUCCESS: \(data)")
            }
        }
    }
    
    func createStep(name: String) {
        let stepToAdd = TaskStep(stepName: name)
        steps.append(stepToAdd)
        
        //firestore
        stepArray.append(stepToAdd.stepName)
    }
    
    func getMyTasks(uid: String) {
        Firestore.firestore().collection("tasks").whereField("creator", isEqualTo: uid).getDocuments { snapshot, error in
            if let error {
                print(error)
            } else {
                guard let snapshot else { return }
                for doc in snapshot.documents {
                    guard let stringSteps = doc.get("steps") as? [String] else { return }
                    var steps = [TaskStep]()
                    for step in stringSteps {
                        steps.append(TaskStep(stepName: step))
                    }
                    let task = Task(name: "Currently no name", creator: uid, members: ["Not", "yet"], steps: steps)
                    
                    DispatchQueue.main.async {
                        self.myTasks.append(task)
                    }
                }
                
            }
        }
    }
}
