//
//  HomeView.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 13/09/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                HStack(spacing: 20) {
                    
                    Image("vivo_icon")
                        .resizable()
                        .frame(width: 23, height: 31)
                        .scaledToFit()
                    
                    Text("Olá, Guilherme")
                        .font(.system(size: 18))
                        .padding(.vertical, 20)
                }
                
                YourPlanModuleView()
                    .padding(.bottom, 40)
                
                FeaturedModuleView(withTitle: true)
                
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    HomeView()
}
