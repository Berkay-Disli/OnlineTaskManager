//
//  TabBarNavigator.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 13.05.2022.
//

import SwiftUI

struct TabBarNavigator: View {
    @State private var viewSelection = 0
    
    var body: some View {
        ZStack {
            
            switch viewSelection {
            case 0:
                MainPage()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            case 1:
                Profile()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            default:
                MainPage()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }
            
            
            
            
            
            
            
            // tab bar
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        viewSelection = 0
                    } label: {
                        Image(systemName: "house")
                            .font(.title)
                            .foregroundColor(viewSelection == 0 ? Color("c1"):.gray)
                    }
                    Spacer()
                    Button {
                        viewSelection = 1
                    } label: {
                        Image(systemName: "person")
                            .font(.title)
                            .foregroundColor(viewSelection == 1 ? Color("c1"):.gray)
                            
                    }

                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width * 0.6, height: 55)
                .background(.white)
                .cornerRadius(100)
                .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 5)
            }
            
        }
    }
}

struct TabBarNavigator_Previews: PreviewProvider {
    static var previews: some View {
        TabBarNavigator()
    }
}
