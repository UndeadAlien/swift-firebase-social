//
//  LoginView.swift
//  CivilGrooming
//
//  Created by Connor Hutchinson on 8/3/22.
//

import SwiftUI

struct UserLoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: UserAuthViewModel
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        
        VStack {
            
            AuthHeaderView(title1: "Hello, ", title2: "Welcome Back")
            
            Image(systemName: "building.columns")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            
            VStack(spacing: 40) {
                CustomInputField(
                    imageName: "envelope",
                    placeholderText: "Email",
                    textCase: .lowercase,
                    keyboardType: .emailAddress,
                    textContentType: .emailAddress,
                    text: $email
                )
                
                CustomInputField(
                    imageName: "lock",
                    placeholderText: "Password",
                    textCase: .lowercase,
                    keyboardType: .default,
                    textContentType: .password,
                    isSecureField: true,
                    text: $password
                )
            }
            .padding(.horizontal, 32)
            .padding(.top, 40)
            
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("Reset View")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(isDarkMode ? .white : .black)
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            Button {
                print("DEBUG: Signing in...")
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(isDarkMode ? .black : .white)
                    .frame(width: 340, height: 50)
                    .background(isDarkMode ? .white : .black)
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            NavigationLink {
                UserRegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                .foregroundColor(isDarkMode ? .white : .black)
            }
            .padding(.bottom, 32)
            
        }
        .ignoresSafeArea()
        
    }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        UserLoginView()
            .preferredColorScheme(.light)
        
        UserLoginView()
            .preferredColorScheme(.dark)
    }
}
#endif
