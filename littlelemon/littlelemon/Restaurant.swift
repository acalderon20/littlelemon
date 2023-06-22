//
//  littlelemonApp.swift
//  littlelemon
//
//  Created by Adolfo Calderon on 6/18/23.
//

import SwiftUI

@main
struct Restaurant: App {
    @StateObject private var auth = Auth()
    
    var body: some Scene {
        WindowGroup {
            Onboarding()
        }
    }
}
