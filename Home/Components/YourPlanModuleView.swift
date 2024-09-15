//
//  YourPlanModuleView.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 13/09/24.
//

import SwiftUI

struct YourPlanModuleView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            
            Text("Suas assinaturas")
                .font(.system(size: 18, weight: .black))
                .foregroundColor(.gray)
            
            VStack(alignment: .leading) {
                Text("Internet para você usar como quiser:")
                    .font(.system(size: 16))
                    .padding(.bottom, 14)
                
                ProgressView(value: 20, total: 100)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color("vivo_purple")))
                HStack(alignment: .bottom) {
                    Text("2,00 GB")
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundColor(Color("vivo_purple"))
                    Text("usados de 10 GB")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.bottom, 5)
                }
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
            .cornerRadius(16)
            .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(Color("light_purple") ,lineWidth: 1))
            
            VStack(alignment: .leading) {
                Text("Fibra 500Mbps.")
                    .font(.system(size: 16))
                    .padding(.bottom, 14)
                
                HStack(alignment: .bottom) {
                    Text("500 Mbps")
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundColor(Color("vivo_purple"))
                    Text("de velocidade")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.bottom, 5)
                    Spacer()
                }
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
            .cornerRadius(16)
            .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(Color("light_purple") ,lineWidth: 1))
        }
    }
}

#Preview {
    YourPlanModuleView()
}
