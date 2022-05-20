//
//  ContentView.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 12.05.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        if authVM.userSession == nil {
            SignIn()
                .transition(AnyTransition.opacity.animation(.easeInOut))
        } else {
            TabBarNavigator()
                .transition(AnyTransition.opacity.animation(.easeInOut))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
