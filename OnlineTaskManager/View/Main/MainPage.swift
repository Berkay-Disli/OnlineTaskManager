//
//  MainPage.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 13.05.2022.
//

import SwiftUI

struct MainPage: View {
    @ObservedObject var tabBarVM: TabNavigationViewModel
    @StateObject var taskVM = TaskViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                // task list
                ScrollView {
                    LazyVStack {
                        ForEach(1...3, id: \.self) { task in
                            MenuTaskItem()
                        }
                    }
                }
            }
            .navigationTitle("My Tasks")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        NewTask(taskViewModel: taskVM, tabBarVM: tabBarVM)
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }

                }
            })
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage(tabBarVM: TabNavigationViewModel())
    }
}
