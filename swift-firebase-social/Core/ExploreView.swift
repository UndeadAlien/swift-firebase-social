//
//  ExploreView.swift
//  CivilGrooming
//
//  Created by Connor Hutchinson on 8/27/22.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    EmptyView()
                } label: {
                    Text("Empty View")
                }
                
                NavigationLink {
                    EmptyView()
                } label: {
                    Text("Empty View")
                }

            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
