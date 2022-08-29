//
//  CustomListToggleItem.swift
//  CivilGrooming
//
//  Created by Connor Hutchinson on 8/27/22.
//

import SwiftUI

struct CustomListToggleItem: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var icon: String
    var text: String
    
    var body: some View {
        
        HStack {
            
            Image(systemName: icon)
            
            Toggle(isOn: $isDarkMode) {
                Text(text)
            }
            
        }
        .foregroundColor(isDarkMode ? .white : .black)
        
    }
}

struct CustomListToggleItem_Previews: PreviewProvider {
    static var previews: some View {
        CustomListToggleItem(icon: "person.fill", text: "Testing")
            .preferredColorScheme(.dark)
        CustomListToggleItem(icon: "person.fill", text: "Testing")
            .preferredColorScheme(.light)
    }
}
