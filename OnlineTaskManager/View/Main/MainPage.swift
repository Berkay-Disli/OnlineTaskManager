//
//  MainPage.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 13.05.2022.
//

import SwiftUI

struct MainPage: View {
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
                        NewTask()
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
        MainPage()
    }
}
