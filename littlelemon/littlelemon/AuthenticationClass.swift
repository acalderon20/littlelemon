//
//  AuthenticationClass.swift
//  littlelemon
//
//  Created by Adolfo Calderon on 6/22/23.
//

import Foundation

class Auth: ObservableObject {
    @Published var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "kIsLoggedIn")
    
    func logIn() {
        isLoggedIn = true
        UserDefaults.standard.set(true, forKey: "kIsLoggedIn")
    }
    
    func logOut() {
        isLoggedIn = false
        UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
    }
}
