//
//  SideMenuView.swift
//  CivilGrooming
//
//  Created by Connor Hutchinson on 8/4/22.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    
    @EnvironmentObject var authViewModel: UserAuthViewModel
    
    var body: some View {
        
        VStack {
            
            if let user = authViewModel.currentUser {
                
                VStack(alignment: .leading, spacing: 32) {
                    
                    VStack(alignment: .leading) {
                        
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 48, height: 48)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            
                            HStack {
                                
                                Text(user.firstName)
                                
                                Text(user.lastName)
                                
                            }
                            .font(.headline)
                            
                        }
                        
                    }
                    .padding(.leading)
                    
                    ForEach(SideMenuViewModel.allCases, id:\.rawValue) { viewModel in
                        if viewModel == .profile {
                            NavigationLink {
                                ProfileView(user: user)
                            } label: {
                                SideMenuOptionRowView(viewModel: viewModel)
                            }
                        }
                        else if viewModel == .logout {
                            Button {
                                print("DEBUG: logging out...")
                                authViewModel.logout()
                            } label: {
                                SideMenuOptionRowView(viewModel: viewModel)
                            }
                        }
                        else {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                    }
                    
                    Spacer()
                    
                }
                
                
            }
            else {
                EmptyView()
            }
            
        }
        
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    
    static private var vm = UserAuthViewModel()
    
    static var previews: some View {
        SideMenuView()
            .environmentObject(vm)
            .preferredColorScheme(.dark)
    }
}
