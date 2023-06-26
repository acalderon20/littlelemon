//
//  UserProfile.swift
//  littlelemon
//
//  Created by Adolfo Calderon on 6/21/23.
//

import SwiftUI


struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    let firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    let lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    let email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    
    var body: some View {
        VStack {
            Text("Personal Info")
                .font(.title)
                .fontWeight(.bold)
            Image("Profile")
                .resizable()
                .frame(width: 200, height: 200)
            VStack(spacing: 5) {
                Text(firstName)
                Text(lastName)
                Text(email)
            }
            .fontWeight(.bold)
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
                self.presentation.wrappedValue.dismiss()
            }
            .padding()
            Spacer()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
