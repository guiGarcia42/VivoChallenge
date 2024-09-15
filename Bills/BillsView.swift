//
//  BillsView.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 13/09/24.
//

import SwiftUI

struct BillsView: View {
    
    @StateObject var vm: BillsViewModel
    
    init(vm: BillsViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(spacing: 20) {
                    Image("vivo_icon")
                        .resizable()
                        .frame(width: 23, height: 31)
                        .scaledToFit()
                    
                    Text("Central de faturas")
                        .font(.system(size: 18))
                        .padding(.vertical, 20)
                }
                
                // Display the FeaturedBill
                if let featuredBill = vm.featuredBill {
                    FeaturedBill(item: featuredBill)
                        .padding(.bottom)
                }
                
                // Group and display the rest of the bills by year
                ForEach(vm.groupedBillsByYear, id: \.key) { year, bills in
                    // Section header
                    if vm.isCurrentYear(year) {
                        Text("Histórico de Faturas")
                            .font(.headline)
                            .padding(.top)
                    } else {
                        Text("\(year)")
                            .font(.headline)
                            .padding(.top)
                    }
                    
                    ForEach(bills) { item in
                        BillItem(item: item)
                    }
                }
            }
            .padding(.horizontal, 20)
            .onAppear {
                vm.fetchBillsList()
            }
        }
    }
}

struct BillsViewPreviews: PreviewProvider {
    static var previews: some View {
        BillsView(vm: BillsViewModel(service: MockBillsService()))
    }
}

class MockBillsService: BillsService {
    override func fetchBillsList() {
        billsList.send(mockBillsList) // Use the mock data
    }
}
