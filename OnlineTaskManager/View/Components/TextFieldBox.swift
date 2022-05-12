//
//  TextFieldBox.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 12.05.2022.
//

import SwiftUI

struct TextFieldBox: View {
    @Binding var text: String
    let placeholder: String
    let icon: String
    var body: some View {
        HStack {
            Image(systemName: icon)
                .padding(.leading, 30)
                .foregroundColor(.gray)
            TextField("", text: $text)
                .placeholder(when: text.isEmpty) {
                    Text(placeholder)
                        .foregroundColor(.gray)
                }
                .foregroundColor(.gray)
                .padding(.horizontal)
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
            if text.contains("@") && text.contains(".com") {
                Image(systemName: "checkmark.circle.fill")
                    .font(.title2)
                    .foregroundColor(.green)
                    .padding(.trailing)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.80, height: 50)
        .background(.white)
        .cornerRadius(100)
        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 5)
    }
}

struct TextFieldBox_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBox(text: .constant(""), placeholder: "Placeholder", icon: "person")
            //.previewLayout(.sizeThatFits)
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
