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
        VStack {
            List {
                Section("Authentication") {
                    Button {
                        authVM.signOut()
                    } label: {
                        Text("Log out")
                    }

                }
            }
        }
        .navigationTitle("Profile")
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Profile()
        }
    }
}
