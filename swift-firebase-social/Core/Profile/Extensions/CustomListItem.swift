//
//  CustomListItem.swift
//  CivilGrooming
//
//  Created by Connor Hutchinson on 8/27/22.
//

import SwiftUI

struct CustomListItem<TargetView: View>: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var content: TargetView
    var listIcon: String
    var listText: String
    
    var body: some View {
        NavigationLink {
            content
        } label: {
            HStack {
                Image(systemName: listIcon)
                Text(listText)
            }
            .foregroundColor(isDarkMode ? .white : .black)
        }
    }
}

struct CustomListItem_Previews: PreviewProvider {
    static var previews: some View {
        CustomListItem(content: EditProfileView(), listIcon: "person", listText: "Edit Profile")
            .preferredColorScheme(.dark)
    }
}
