//
//  RootView.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 15/09/24.
//

import SwiftUI

struct RootView: View {
    
    @State private var isLoggedIn: Bool = false // Track login state
    
    var body: some View {
        if isLoggedIn {
            // If logged in, show MainTabView
            MainTabView(
                isLoggedIn: $isLoggedIn
            )
        } else {
            // Otherwise, show StartupView
            StartupView(
                vm: StartupViewModel(
                    authHandler: AuthHandlerImpl()
                ),
                isLoggedIn: $isLoggedIn
            )
        }
    }
}
