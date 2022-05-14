//
//  TabNavigationViewModel.swift
//  OnlineTaskManager
//
//  Created by Berkay Disli on 14.05.2022.
//

import Foundation

class TabNavigationViewModel: ObservableObject {
    @Published var viewSelection = 0
    @Published var submitButton = false
    init() {
        
    }
    
    func setHomeView() {
        viewSelection = 0
    }
    
    func setProfileView() {
        viewSelection = 1
    }
    
    func toggleSubmitButton() {
        submitButton.toggle()
    }
}
