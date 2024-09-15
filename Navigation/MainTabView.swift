//
//  MainTabView.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 13/09/24.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab: Int = 0 // Track the selected tab
    @Binding var isLoggedIn: Bool // Binding to track login state

    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0) // Tag for home
            
            BillsView(vm: BillsViewModel(service: BillsService()))
                .tabItem {
                    Image(systemName: "doc.text")
                    Text("Bills")
                }
                .tag(1) // Tag for bills
            
            PlansView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Plans")
                }
                .tag(2) // Tag for plans
            
            ProfileView(vm: ProfileViewModel(service: ProfileService()), isLoggedIn: $isLoggedIn) // Pass the binding to ProfileView
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
                .tag(3) // Tag for profile
        }
        .accentColor(Color("vivo_purple")) // Customize color
    }
}

#Preview {
    MainTabView(isLoggedIn: .constant(true))
}
