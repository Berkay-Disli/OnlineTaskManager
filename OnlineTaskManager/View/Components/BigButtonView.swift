//
//  Button.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 12.05.2022.
//

import SwiftUI

struct BigButtonView: View {
    let text: String
    let color: Color
    var body: some View {
        HStack {
            Text(text)
                .font(.title3).bold()
                .foregroundColor(.white)
        }
        .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
        .background(color)
        .cornerRadius(100)
        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
    }
}

struct BigButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BigButtonView(text: "Sign In", color: .orange)
    }
}
