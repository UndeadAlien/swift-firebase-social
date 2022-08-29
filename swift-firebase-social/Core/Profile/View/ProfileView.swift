//
//  ProfileView.swift
//  CivilGrooming
//
//  Created by Connor Hutchinson on 8/3/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @ObservedObject var viewModel: ProfileViewModel
    @Namespace var animation
    
    init(user: Client) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                VStack(spacing: 35) {
                    profileImageView
                    userInfoDetails
                }
                
                editProfile
                
            }
            .navigationTitle("Profile")
        }
        
    }
}

#if DEBUG
struct ProfileView_Previews: PreviewProvider {
    static private var testUser = Client(
        id: NSUUID().uuidString,
        firstName: "Bobby",
        lastName: "Barker",
        profileImageUrl: "addProfile",
        email: "bbarker@gmail.com"
    )
    
    static private var vm = ProfileViewModel(user: testUser)
    
    static private var isDarkMode = true
    
    static var previews: some View {
        ProfileView(user: testUser)
            .environmentObject(vm)
            .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
#endif

extension ProfileView {
    
    var profileImageView: some View {
        ZStack {
            HStack(alignment: .center) {
                KFImage(URL(string: viewModel.user.profileImageUrl)!)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(isDarkMode ? .white : .black, lineWidth: 4)
                    )
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                    .frame(width: 120, height: 120)
            }
            
            Button {
                
            } label: {
                Image(systemName: "plus.square.fill")
                    .foregroundColor(isDarkMode ? .white : .black)
                    .font(.system(size: 32))
                    .offset(x: 50, y: 50)
            }
        }
        .frame(height: 96)
    }

    var userInfoDetails: some View {
        VStack(alignment: .center, spacing: 15) {

            HStack(spacing: .none) {
                Text("\(viewModel.user.firstName)")
                Text("\(viewModel.user.lastName)")
            }
            .font(.title.bold())
            .foregroundColor(isDarkMode ? .white : .black)
            
            Text("\(viewModel.user.email)")
                .font(.headline)
                .foregroundColor(isDarkMode ? .white : .black)
        }
    }
    
    var editProfile: some View {
        List {
            NavigationLink(destination: EditProfileView()) {
                HStack {
                    Image(systemName: "person.fill")
                    Text("Edit Profile")
                }
                .foregroundColor(isDarkMode ? .white : .black)
            }
            
            CustomListToggleItem(icon: "eye.fill", text: "Dark Mode")
            
            
            Button {
                // logout
            } label: {
                HStack {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                    Text("Logout")
                }
                .foregroundColor(.red)
            }
            
        }
    }

}
