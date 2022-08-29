//
//  User.swift
//  CivilGrooming
//
//  Created by Connor Hutchinson on 8/3/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Client: Identifiable, Decodable {
    @DocumentID var id: String?
    let firstName: String
    let lastName: String
    let profileImageUrl: String
    let email: String
    
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == id
    }
}
