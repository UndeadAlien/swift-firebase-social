//
//  ContentView.swift
//  swift-firebase-social
//
//  Created by Connor Hutchinson on 8/29/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = true
    @EnvironmentObject var viewModel: UserAuthViewModel
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        Group {
            
            if viewModel.userSession == nil {
                UserLoginView()
            }
            else {
                mainInterfaceView
            }
            
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

extension ContentView {
    
    var mainInterfaceView: some View {
        
        MainTabView()
            .navigationBarHidden(showMenu)
        
    }
    
}
