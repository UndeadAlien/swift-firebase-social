//
//  EditProfileView.swift
//  CivilGrooming
//
//  Created by Connor Hutchinson on 8/27/22.
//

import SwiftUI

struct EditProfileView: View {
    
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                NavigationLink {
                    EmptyView()
                } label: {
                    HStack {
                        Image(systemName: "person.fill")
                        Text("Testing")
                    }
                }

                
            }
            
        }
        
        
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
