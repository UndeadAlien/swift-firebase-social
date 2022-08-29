//
//  UserService.swift
//  CivilGrooming
//
//  Created by Connor Hutchinson on 8/3/22.
//

import FirebaseFirestore

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(Client) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: Client.self) else { return }
                completion(user)
            }
    }
    
    func fetchUsers(completion: @escaping([Client]) -> Void) {
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                let users = documents.compactMap({ try? $0.data(as: Client.self)})
                
                completion(users)
            }
    }
    
    
}
