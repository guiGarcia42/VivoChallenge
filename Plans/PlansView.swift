//
//  PlansView.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 13/09/24.
//

import SwiftUI

struct PlansView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(spacing: 20) {
                    Image("vivo_icon")
                        .resizable()
                        .frame(width: 23, height: 31)
                        .scaledToFit()
                    
                    Text("Contrate serviços adicionais agora")
                        .font(.system(size: 18))
                        .padding(.vertical, 20)
                }
                
                FeaturedModuleView(withTitle: false)
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    PlansView()
}
