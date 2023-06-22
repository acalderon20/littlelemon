//
//  Onboarding.swift
//  littlelemon
//
//  Created by Adolfo Calderon on 6/20/23.
//

import SwiftUI

let kFirstName: String = "kFirstName"
let kLastName: String = "kLastName"
let kEmail: String = "kEmail"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    
    @EnvironmentObject var auth: Auth
//    @State var isLoggedIn: Bool? = nil
    @State var isLoggedIn = false
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var destination: [ViewType] = []
    
    
    enum ViewType: Hashable {
        case home
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                        EmptyView()
                    }
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Register") {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: "kIsLoggedIn")
                        isLoggedIn = true
                    }
                    .disabled(firstName.isEmpty || lastName.isEmpty || !isValidEmail(email))
                }
            }
            .padding(100)
            .onAppear(perform: {
                if UserDefaults.standard.bool(forKey: "kIsLoggedIn") == true{
                    isLoggedIn = true
                }
            })
            Spacer()
        }
    }
}


struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

