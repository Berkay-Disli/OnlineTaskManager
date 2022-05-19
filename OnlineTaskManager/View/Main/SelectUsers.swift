//
//  SelectUsers.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 15.05.2022.
//

import SwiftUI

struct SelectUsers: View {
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(1...10, id: \.self) { user in
                        Text("User \(user)")
                            .bold()
                            .padding()
                            .foregroundColor(.white)
                            .background(.pink)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct SelectUsers_Previews: PreviewProvider {
    static var previews: some View {
        SelectUsers()
    }
}
