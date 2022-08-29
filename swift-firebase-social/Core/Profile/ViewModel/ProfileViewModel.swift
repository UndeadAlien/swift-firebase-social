//
//  ProfileViewModel.swift
//  CivilGrooming
//
//  Created by Connor Hutchinson on 8/3/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    private let userService = UserService()
    
    let user: Client
    
    init(user: Client) {
        self.user = user
    }
    
}
