//
//  AuthViewModel.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 19.05.2022.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var user: User?
    
    init() {
        
    }
    
    func registerUser(email: String, password: String, name: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                guard let user = result?.user else { return }
                
                let data: [String:Any] = ["email": email, "name": name]
                
                Firestore.firestore().collection("Users").document(user.uid).setData(data)
                
            }
            
            
            
            
        }
    }
    
    func signInUser(email: String, password: String) {
        
    }
}
