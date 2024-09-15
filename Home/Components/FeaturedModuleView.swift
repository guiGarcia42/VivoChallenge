//
//  FeaturedModuleView.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 13/09/24.
//

import Foundation
import SwiftUI

struct FeaturedModuleView: View {
    
    var withTitle: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if withTitle {
                Text("Apps em destaque:")
                    .font(.system(size: 18, weight: .black))
                    .foregroundColor(.gray)
            }
            
            TabView {
                ForEach(featuredList) { item in
                    VStack(alignment: .leading, spacing: 10) {
                        Image(item.image)
                            .resizable()
                            .frame(width: 300, height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .scaledToFit()
                        
                        Text(item.name)
                            .font(.system(size: 16))
                        
                        Text(item.description)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Text("A partir de R$ \(String(format: "%.2f", item.price))/mês")
                            .font(.system(size: 14, weight: .bold))
                    }
                    .padding(.horizontal, 30)
                }
            }
            .frame(height: 430)
            .tabViewStyle(.page(indexDisplayMode: .never))
            
        }
    }
}

#Preview {
    FeaturedModuleView(withTitle: true)
}
