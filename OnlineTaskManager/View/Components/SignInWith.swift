//
//  SignInWith.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 12.05.2022.
//

import SwiftUI

struct SignInWith: View {
    let icon: String
    let name: String
    let color: Color
    let textColor: Color
    var body: some View {
        HStack {
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                
                
            Text(name)
                .bold()
                .padding(.trailing)
                .foregroundColor(textColor)
        }
        .frame(width: 170, height: 40)
        .background(color)
        .cornerRadius(100)
        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
    }
}

struct SignInWith_Previews: PreviewProvider {
    static var previews: some View {
        SignInWith(icon: "apple", name: "Apple", color: .black, textColor: .white)
    }
}
