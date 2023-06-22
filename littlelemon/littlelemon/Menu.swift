//
//  Menu.swift
//  littlelemon
//
//  Created by Adolfo Calderon on 6/21/23.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack (spacing: 10) {
            Text("Little Lemon Application")
                .font(.title)
            Text("Chicago")
                .font(.headline)
            Text("Your local mediterranean Bistro")
            Spacer()
            List{
                
            }
            Spacer()
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
