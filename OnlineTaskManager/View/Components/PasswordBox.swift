//
//  PasswordBox.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 12.05.2022.
//

import SwiftUI

struct PasswordBox: View {
    @Binding var passwordText: String
    var body: some View {
        HStack {
            Image(systemName: "lock")
                .padding(.leading, 30)
                .foregroundColor(.gray)
            SecureField("", text: $passwordText)
                .placeholder(when: passwordText.isEmpty) {
                    Text("password")
                        .foregroundColor(.gray)
                }
                .foregroundColor(.gray)
                .padding(.horizontal)
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
        }
        .padding(.trailing)
        .frame(width: UIScreen.main.bounds.width * 0.80, height: 50)
        .background(.white)
        .cornerRadius(100)
        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
    }
}

struct PasswordBox_Previews: PreviewProvider {
    static var previews: some View {
        PasswordBox(passwordText: .constant(""))
    }
}
