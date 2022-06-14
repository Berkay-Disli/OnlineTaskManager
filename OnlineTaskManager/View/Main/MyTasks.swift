//
//  MyTasks.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 14.06.2022.
//

import SwiftUI

struct MyTasks: View {
    @StateObject var taskVM = TaskViewModel()
    @EnvironmentObject var authVM: AuthViewModel
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(taskVM.myTasks) { task in
                    HStack {
                        VStack {
                            Text(task.name)
                            Text(task.creator)
                        }
                        
                        VStack {
                            ForEach(task.steps) { step in
                                Text(step.stepName)
                            }
                        }
                        
                    }
                }
            }
            .onAppear {
                taskVM.getMyTasks(uid: authVM.userSession!.uid)
            }
        }
        .navigationBarBackButtonHidden()
        
    }
}

struct MyTasks_Previews: PreviewProvider {
    static var previews: some View {
        MyTasks()
            .environmentObject(AuthViewModel())
    }
}
