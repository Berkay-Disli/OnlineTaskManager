//
//  Profile.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 13.05.2022.
//

import SwiftUI

struct Profile: View {
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    
                    NavigationLink {
                        MyTasks()
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                                .frame(width: 23, height: 23)
                                .background(.green)
                                .cornerRadius(5)
                            Text("My Tasks")
                                .bold()
                        }
                    }

                    
                    Button {
                        authVM.signOut()
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "person")
                                .foregroundColor(.white)
                                .frame(width: 23, height: 23)
                                .background(.red)
                                .cornerRadius(5)
                            Text("Log out")
                                .bold()
                        }
                    }
                }
            }
            .onAppear(perform: {
                authVM.getCurrentUserName()
            })
            .navigationTitle(authVM.userName)
            .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
            Profile()
                .environmentObject(AuthViewModel())
        
    }
}
