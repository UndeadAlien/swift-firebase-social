//
//  RegistrationView.swift
//  CivilGrooming
//
//  Created by Connor Hutchinson on 8/3/22.
//

import SwiftUI

struct UserRegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var lastName = ""
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: UserAuthViewModel
    
    var body: some View {
        VStack {
            
            AuthHeaderView(title1: "Create an account", title2: "")
            
            Button {
                print("DEBUG: Picking image...")
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                }
                else {
                    Image("addProfile")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color("themeColor"))
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .modifier(ProfileImageModifier())
            
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
                    imageName: "person",
                    placeholderText: "First Name",
                    textContentType: .name,
                    textInputAutoCapital: .words,
                    text: $firstName
                )
                
                CustomInputField(
                    imageName: "person",
                    placeholderText: "Last Name",
                    textContentType: .name,
                    textInputAutoCapital: .words,
                    text: $lastName
                )
                
                CustomInputField(
                    imageName: "key",
                    placeholderText: "Password",
                    textContentType: .newPassword,
                    isSecureField: true,
                    text: $password
                )
                
            }
            .padding(32)
            
            Button {
                print("DEBUG: Signing up...")
                
                viewModel.register(
                    withEmail: email,
                    password: password,
                    firstName: firstName,
                    lastName: lastName,
                    image: selectedImage
                )
                
            } label: {
                Text("Sign up")
                    .font(.headline)
                    .foregroundColor(Color("buttonTextColor"))
                    .frame(width: 340, height: 50)
                    .background(Color("themeColor"))
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else {
            return
        }
        
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 180, height: 180)
            .overlay(
                RoundedRectangle(cornerRadius: 90)
                    .stroke(Color("themeColor"), lineWidth: 10)
            )
            .clipShape(Circle())
    }
}

#if DEBUG
struct RegistrationView_Previews: PreviewProvider {
    
    static private var vm = UserAuthViewModel()
    
    static var previews: some View {
        UserRegistrationView()
            .preferredColorScheme(.dark)
            .environmentObject(vm)
    }
}
#endif

