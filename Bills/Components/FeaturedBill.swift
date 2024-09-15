//
//  FeaturedBill.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 15/09/24.
//

import SwiftUI

struct FeaturedBill: View {
    
    let item: BillsModel
    
    private var icon: String
    private var description: String
    private var color: Color
    private var backgroundColor: Color
    
    init(item: BillsModel) {
        self.item = item
        
        if item.isPaid {
            self.icon = "checkmark"
            self.description = "Paga"
            self.color = .green
            self.backgroundColor = Color.green.opacity(0.2)
        } else {
            self.icon = "clock"
            self.description = "Pronta pra pagar"
            self.color = .red
            self.backgroundColor = Color.red.opacity(0.2)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 80) {
            HStack {
                HStack {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                    
                    Text(description)
                        .font(.system(size: 14))
                }
                .foregroundColor(color)
                .padding(8)
                .background(backgroundColor)
                .cornerRadius(14)
                
                Spacer()
                
                Image(systemName: "ellipsis")
            }
            
            HStack {
                VStack(alignment: .leading) {
                    // First Text: "Venceu em <day>/<month>"
                    Text("Venceu em \(item.date.formattedDayMonth())")
                        .font(.system(size: 18))
                    
                    // Second Text: "Fatura de <month name>"
                    Text("Fatura de \(item.date.formattedMonthName())")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Text(String(format: "R$ %.2f", item.price)) // Display the price
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("vivo_purple"))
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
        .cornerRadius(16)
        .overlay(RoundedRectangle(cornerRadius: 16)
            .stroke(Color("light_purple") ,lineWidth: 1))
    }
}

#Preview {
    FeaturedBill(item: mockBillsList[0])
}
