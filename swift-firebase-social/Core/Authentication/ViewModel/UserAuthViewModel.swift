//
//  AuthViewModel.swift
//  CivilGrooming
//
//  Created by Connor Hutchinson on 8/3/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class UserAuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: Client?
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
            print("DEBUG: Logged in with email: \(String(describing: self.userSession?.email))")
        }
    }
    
    func register(withEmail email: String, password: String, firstName: String, lastName: String, image: UIImage?) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            let userData = [
                "email": email,
                "firstName": firstName,
                "lastName": lastName,
                "uid": user.uid
            ]
            
            print("DEBUG: Getting ready to upload profile image...")
            
            if let image = image {
                ImageUploader.uploadImage(image: image) { profileImageUrl in
                    Firestore.firestore().collection("users")
                        .document(user.uid)
                        .updateData(["profileImageUrl": profileImageUrl]) { _ in
                            self.userSession = self.userSession
                            self.fetchUser()
                        }
                }
            }
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(userData) { _ in
                    print("DEBUG: Uploaded user data")
                    self.didAuthenticateUser = true
                }
            
        }
    }
    
    func logout() {
        didAuthenticateUser = false
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}
