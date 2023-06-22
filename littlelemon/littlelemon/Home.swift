//
//  Home.swift
//  littlelemon
//
//  Created by Adolfo Calderon on 6/21/23.
//

import SwiftUI




struct Home: View {
    
    var body: some View {
        TabView {
            Menu()
                .tabItem{
                    Label("Menu", systemImage: "menucard")
                }
            UserProfile()
                .tabItem{
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
