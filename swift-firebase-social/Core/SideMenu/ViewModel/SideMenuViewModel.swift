//
//  SideMenuViewModel.swift
//  CivilGrooming
//
//  Created by Connor Hutchinson on 8/4/22.
//

import Foundation
import SwiftUI

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case logout
    
    var title: String {
        switch self {
            case .profile: return "Profile"
            case .logout: return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
            case .profile: return "person"
            case .logout: return "arrow.left.square"
        }
    }
}
