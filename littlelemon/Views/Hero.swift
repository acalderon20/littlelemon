//
//  Hero.swift
//  littlelemon
//
//  Created by Adolfo Calderon on 6/26/23.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 427, height: 339)
                .background(Color(red: 0.29, green: 0.37, blue: 0.34))
            HStack {
                VStack {
                    VStack {
                        Text("Little Lemon")
                            .font(
                                Font.custom("Markazi Text", size: 36)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.96, green: 0.81, blue: 0.08))
                        .frame(width: 225, height: 40, alignment: .topLeading)
                        Text("Chicago")
                            .font(Font.custom("Markazi Text", size: 26))
                            .font(.title)
                            .foregroundColor(Color(red: 0.93, green: 0.94, blue: 0.93))
                            .padding(.bottom)
                            .frame(width: 225, height: 40, alignment: .topLeading)
                    }
                    
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .font(Font.custom("Karla", size: 16))
                        .foregroundColor(Color(red: 0.93, green: 0.94, blue: 0.93))
                        .frame(width: 212, height: 119, alignment: .leading)
                        .padding(.trailing, 10)
                }
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 140, height: 174)
                    .background(
                        Image("Hero image")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 140, height: 174)
                            .clipped()
                            .cornerRadius(8)
                    )
            }
        }
        .frame(width: 427, height: 339)
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero()
    }
}
