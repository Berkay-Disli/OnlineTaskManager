//
//  AuthViewModel.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 19.05.2022.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: User?
    @Published var allUsers = [String]()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func registerUser(email: String, password: String, name: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error)
            } else {
                guard let user = result?.user else { return }
                self.userSession = user
                print("User created: \(user.email ?? "no email")")
                
                
                let data: [String:Any] = ["email": email, "name": name]
                
                Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    } else {
                        print("User info 'name': \(name) is stored at Firestore")
                    }
                }
            }
        }
    }
    
    
    func signInUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            } else {
                guard let user = result?.user else { return }
                self.userSession = user
                print("User \(user.email ?? "no info") signed in")
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            userSession = nil
            print("User signed out")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    // give all users
    func getAllUsers() {
        Firestore.firestore().collection("users").getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            } else {
                guard let snapshot = snapshot else { return }
                for document in snapshot.documents {
                    self.allUsers.append(document.documentID)
                }

            }
        }
    }
}
