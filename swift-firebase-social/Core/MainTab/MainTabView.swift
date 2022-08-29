//
//  MainTabView.swift
//  CivilGrooming
//
//  Created by Connor Hutchinson on 8/3/22.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var viewModel: UserAuthViewModel
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        
        TabView {

            if let user = viewModel.currentUser {
                
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                    }
                    .tag(0)
                    .foregroundColor(isDarkMode ? .white : .black)
                
                ExploreView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                    .tag(1)
                    .foregroundColor(isDarkMode ? .white : .black)
                
                IdkYetView()
                    .tabItem {
                        Image(systemName: "questionmark.circle")
                    }
                    .tag(2)
                    .foregroundColor(isDarkMode ? .white : .black)
                
                ProfileView(user: user)
                    .tabItem {
                        Image(systemName: "person.fill")
                    }
                    .tag(3)
                    .foregroundColor(isDarkMode ? .white : .black)
            }
        }
        
    }
}

#if DEBUG
struct MainTabView_Previews: PreviewProvider {
    
    static private var vm = UserAuthViewModel()
    
    static var previews: some View {
        MainTabView()
            .environmentObject(vm)
            .preferredColorScheme(.dark)
    }
}
#endif
