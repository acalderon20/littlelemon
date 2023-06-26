//
//  Header.swift
//  littlelemon
//
//  Created by Adolfo Calderon on 6/26/23.
//

import SwiftUI

struct Header: View {
    var body: some View {
        ZStack {
            Image("Logo")
            
            HStack {
                Spacer()
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 50, height: 47, alignment: .centerLastTextBaseline)
                  .background(
                    Image("Profile")
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 50, height: 47)
                      .clipped()
              )
                  .padding()
            }

        }
    }

}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
