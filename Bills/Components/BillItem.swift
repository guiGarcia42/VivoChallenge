//
//  BillItem.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 15/09/24.
//

import SwiftUI

struct BillItem: View {
    
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
        HStack(spacing: 10) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(color) // Icon color
                .padding(10)
                .background(Circle().fill(backgroundColor))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(item.date.formattedMonthName())
                    .font(.system(size: 16))
                
                Text(description)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text(String(format: "R$ %.2f", item.price))
                .font(.system(size: 16))
                .foregroundColor(.gray)
            
            Image(systemName: "chevron.right")
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
        .cornerRadius(16)
        .overlay(RoundedRectangle(cornerRadius: 16)
            .stroke(Color("light_purple") ,lineWidth: 1))
    }
}

#Preview {
    BillItem(item: mockBillsList[0])
}
