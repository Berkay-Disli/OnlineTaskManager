//
//  SelectUsers.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 15.05.2022.
//

import SwiftUI

struct SelectUsers: View {
    @EnvironmentObject var authVM: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("c1"), Color("c2")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        authVM.clearSelectedUsers()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                }
                .padding([.horizontal, .top])
                .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 0)
                
                
                
                ScrollView {
                    LazyVStack {
                        ForEach(authVM.allUsers, id: \.self) { user in
                            HStack(spacing: 4) {
                                Image(systemName: "person")
                                    .font(.system(size: 70))
                                    .padding(.trailing)
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(String(user))
                                        .font(.title3).bold()
                                    Text("Job Title")
                                }
                                Spacer()
                                if authVM.selectedUsers.contains(String(user)) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(.green)
                                        .blendMode(.normal)
                                        .transition(AnyTransition.scale.animation(.easeInOut(duration: 0.15)))
                                }
                            }
                            .padding(.horizontal)
                            .frame(width: UIScreen.main.bounds.width - 30, height: 80)
                            .foregroundColor(.black)
                            .background(.thinMaterial)
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 5)
                            .onTapGesture {
                                authVM.selectUsers(name: String(user))
                            }
                        }
                    }
                }
                .padding(.top)
            }
        }
    }
}

struct SelectUsers_Previews: PreviewProvider {
    static var previews: some View {
        SelectUsers()
            .environmentObject(AuthViewModel())
    }
}
