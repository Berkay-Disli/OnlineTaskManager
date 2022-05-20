//
//  Register.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 12.05.2022.
//

import SwiftUI

struct SignIn: View {
    @State private var email = ""
    @State private var passwordText = ""
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        NavigationView {
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
                        Text("Don't have an account?")
                        
                        NavigationLink {
                            Register()
                        } label: {
                            Text("Sign Up")
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
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}

extension SignIn {
    var header: some View {
        VStack {
            Spacer()
            Text("Sign In")
                .font(.system(size: 33)).bold()
                .padding(.bottom, 30).padding(.top, 50)
            TextFieldBox(text: $email, placeholder: "e-mail", icon: "person")
                .padding(.vertical, 10)
            
            PasswordBox(passwordText: $passwordText)
                .padding(.bottom, 20)
            
            Button {
                authVM.signInUser(email: email, password: passwordText)
            } label: {
                BigButtonView(text: "Sign In", color: Color("btn1"))
                    .padding()
            }

            
            Text("Forgot Password?")
                .font(.callout).bold()
                .padding(.bottom)
            
            Spacer()
        }
        .foregroundColor(.white)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.65)
        .background(LinearGradient(colors: [Color("c1"), Color("c2")], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

extension View {
    func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
}
