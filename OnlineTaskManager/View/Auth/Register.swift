//
//  Register.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 12.05.2022.
//

import SwiftUI

struct Register: View {
    @State private var email = ""
    @State private var name = ""
    @State private var passwordText = ""
    @Environment(\.dismiss) var dismiss
    @State private var isLeader = false
    @EnvironmentObject var authVM: AuthViewModel

    var body: some View {
        VStack(spacing: 0) {
            //header
            header
            Rectangle().fill(Color("btn1"))
                .frame(width: UIScreen.main.bounds.width, height: 5)
            
            VStack {
                Spacer()
                Text("or connect with:")
                    .foregroundColor(.gray)
                
                HStack(spacing: 20) {
                    
                    SignInWith(icon: "google", name: "Google", color: .white, textColor: .black)
                    
                    SignInWith(icon: "apple", name: "Apple", color: .white, textColor: .black)
                        .colorInvert()
                }
                .padding(.vertical).padding(.bottom)
                
                Spacer()
                HStack {
                    Text("Already have an account?")
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Sign In")
                            .bold()
                    }

                }
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.bottom, 30)
            }
            Spacer()
        }
        .onTapGesture {
            hideKeyboard()
        }
        .ignoresSafeArea()
        
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}

extension Register {
    var header: some View {
        VStack {
            Spacer()
            Text("Sign Up")
                .font(.system(size: 33)).bold()
                .padding(.bottom, 30).padding(.top, 70)
            TextFieldBox(text: $name, placeholder: "name", icon: "person")
            
            TextFieldBox(text: $email, placeholder: "e-mail", icon: "person")
                .padding(.vertical, 10)
            
            PasswordBox(passwordText: $passwordText)
                .padding(.bottom, 20)
            
            HStack {
                Text("Team Lead")
                    .bold()
                Toggle(isOn: $isLeader ) {}.labelsHidden()
                    .padding(.horizontal)
            }
            .padding(.horizontal)
            .frame(width: UIScreen.main.bounds.width * 0.80, height: 50)
            
            Button {
                authVM.registerUser(email: email, password: passwordText, name: name)
            } label: {
                BigButtonView(text: "Sign Up", color: Color("btn1"))
                    .padding()
            }

            
            
            
            Spacer()
        }
        .foregroundColor(.white)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.65)
        .background(LinearGradient(colors: [Color("c1"), Color("c2")], startPoint: .topLeading, endPoint: .bottomTrailing))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
