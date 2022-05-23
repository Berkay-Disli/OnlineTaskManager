//
//  NewTask.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 13.05.2022.
//

import SwiftUI

struct NewTask: View {
    @State private var taskName = ""
    @Environment(\.dismiss) var dismiss
    @State private var stepName = ""
    @ObservedObject var taskViewModel: TaskViewModel
    @ObservedObject var tabBarVM: TabNavigationViewModel
    @State private var showUserSheet = false
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(colors: [Color("c1"), Color("c2")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                //head
                VStack {
                    Text("Create a Task")
                        .font(.system(size: 30)).bold()
                        .foregroundColor(.white)
                        .padding(.top, -20)
                    TextFieldBox(text: $taskName, placeholder: "Task Name", icon: "tag")
                }
                
                // add task step
                addStep
                    .padding(.vertical)
                
                // select users
                Button {
                    authVM.getAllUsers()
                    showUserSheet.toggle()
                } label: {
                    Text("Select Users")
                        .bold().foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width * 0.80, height: 50)
                        .background(.white)
                        .cornerRadius(100)
                        .padding(.bottom)
                }

                
                
                // show tasks
                ScrollView {
                    Text("All Steps")
                        .font(.headline)
                        .padding(.top)
                    LazyVStack {
                        ForEach(taskViewModel.steps) { step in
                            TaskStepItem(stepName: step.stepName)
                                .transition(AnyTransition.scale.animation(.easeInOut))
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.8, height: 400)
                .background(.white)
                .cornerRadius(20)
                
                    
                    
            }
        }
        .sheet(isPresented: $showUserSheet, content: {
            SelectUsers()
        })
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    tabBarVM.toggleSubmitButton()
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    taskViewModel.createTask(taskName: taskName, creator: authVM.userSession?.uid ?? "0", members: ["User2, User3"])
                    tabBarVM.toggleSubmitButton()
                    dismiss()
                } label: {
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                }

            }
        })
        .navigationBarBackButtonHidden(true)
        .onAppear {
            tabBarVM.toggleSubmitButton()
        }
        
        
    }
}

struct NewTask_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewTask(taskViewModel: TaskViewModel(), tabBarVM: TabNavigationViewModel())
        }
    }
}

extension NewTask {
    var addStep: some View {
        HStack {
            Image(systemName: "pencil")
                .padding(.leading, 30)
                .foregroundColor(.gray)
            TextField("", text: $stepName)
                .placeholder(when: stepName.isEmpty) {
                    Text("Add Step")
                        .foregroundColor(.gray)
                }
                .foregroundColor(.gray)
                .padding(.horizontal)
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
            
            if stepName.count >= 5 {
                Button {
                    taskViewModel.createStep(name: stepName)
                    stepName = ""
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.green)
                        .padding(.trailing)
                        .transition(AnyTransition.opacity.animation(.easeInOut))
                }

            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.80, height: 50)
        .background(.white)
        .cornerRadius(100)
        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
    }
}
