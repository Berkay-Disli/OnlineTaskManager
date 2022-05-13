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
                    TextFieldBox(text: $taskName, placeholder: "Task Name", icon: "tag")
                }
                
                // add task step
                addStep
                    .padding(.vertical)
                
                // show tasks
                
                ScrollView {
                    Text("All Steps")
                        .font(.headline)
                        .padding(.top)
                    LazyVStack {
                        ForEach(1...14, id: \.self) { step in
                            TaskStepItem(stepName: "Something to do")
                        }
                    }
                }
                
                .frame(width: UIScreen.main.bounds.width * 0.8, height: 430)
                .background(.white)
                .cornerRadius(20)
                
                    
                    
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                }
            }
        })
        .navigationBarBackButtonHidden(true)
    }
}

struct NewTask_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewTask()
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
                    // add step to task list
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
