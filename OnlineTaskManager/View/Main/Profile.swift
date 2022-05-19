//
//  Profile.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 13.05.2022.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack {
            List {
                Section("Authentication") {
                    Button {
                        // log out
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
