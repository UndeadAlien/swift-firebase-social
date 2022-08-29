//
//  AuthHeaderView.swift
//  CivilGrooming
//
//  Created by Connor Hutchinson on 8/3/22.
//

import SwiftUI

struct AuthHeaderView: View {
    
    let title1: String
    let title2: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack { Spacer() }
            
            HStack {
                Text(title1)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text(title2)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            
        }
        .frame(height: 260)
        .padding(.leading)
        .foregroundColor(Color("textColor"))
        
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title1: "Welcome, ", title2: "Bob")
            .preferredColorScheme(.dark)
    }
}
