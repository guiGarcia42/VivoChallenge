//
//  PlansView.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 13/09/24.
//

import SwiftUI

struct PlansView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 20) {
                    Image("vivo_icon")
                        .resizable()
                        .frame(width: 23, height: 31)
                        .scaledToFit()
                    
                    Text("Contrate serviços adicionais agora")
                        .font(.system(size: 18))
                        .padding(.vertical, 20)
                }
                
                Text("Seu plano atual:")
                    .font(.system(size: 18, weight: .black))
                    .foregroundColor(.gray)
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Vivo Familia + Fibra")
                            .font(.system(size: 16))
                        
                        Spacer()
                        
                        Image(systemName: "ellipsis")
                    }
                    
                    Text("10 GB de Internet móvel\n500 Mbps de Fibra óptica")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text("Valor total:")
                            .font(.system(size: 18))
                        
                        Spacer()
                        
                        Text(String(format: "R$ %.2f", 200.5)) // Display the price
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color("vivo_purple"))
                    }
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 20)
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("light_purple") ,lineWidth: 1))
                
                Text("Aplicativos com descontos especiais:")
                    .padding(.top, 20)
                    .font(.system(size: 18, weight: .black))
                    .foregroundColor(.gray)
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(featuredList) { item in
                        VStack(alignment: .leading, spacing: 10) {
                            Image(item.image)
                                .resizable()
                                .frame(height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                .scaledToFit()
                            
                            Text(item.name)
                                .font(.system(size: 16, weight: .bold))
                            
                            Text(item.description)
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                                .lineLimit(2)
                            
                            Text("A partir de \(String(format: "R$ %.2f", item.price)) / mês")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .padding(.horizontal, 5)
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    PlansView()
}
