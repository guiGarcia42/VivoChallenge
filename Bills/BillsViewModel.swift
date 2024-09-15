//
//  BillsViewModel.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 15/09/24.
//

import Foundation
import Combine

class BillsViewModel: ObservableObject {
    
    @Published var billsList: [BillsModel] = []
    @Published var featuredBill: BillsModel? // FeaturedBill
    @Published var groupedBillsByYear: [(key: String, value: [BillsModel])] = []
    
    let service: BillsService
    private var cancellable = Set<AnyCancellable>()
    
    init(service: BillsService) {
        self.service = service
        bind()
    }
    
    private func bind() {
        service.billsList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] list in
                self?.processBills(list)
            }
            .store(in: &cancellable)
    }
    
    private func processBills(_ list: [BillsModel]) {
        guard !list.isEmpty else { return }
        
        let calendar = Calendar.current
        
        // Group the bills by year
        let groupedBills = Dictionary(grouping: list) { bill in
            calendar.component(.year, from: bill.date)
        }
        
        // Get the latest year
        let latestYear = groupedBills.keys.max() ?? calendar.component(.year, from: Date())
        
        // Extract the first bill of the latest year as the featured bill
        if let latestYearBills = groupedBills[latestYear], !latestYearBills.isEmpty {
            self.featuredBill = latestYearBills.first
            self.billsList = list.filter { $0.id != latestYearBills.first?.id }
        } else {
            self.billsList = list
        }
        
        // Prepare grouped bills by year as String (for proper formatting)
        self.groupedBillsByYear = groupedBills
            .sorted(by: { $0.key > $1.key })
            .map { (key: Int, value: [BillsModel]) in
                (key: String(key), value: value)
            }
    }
    
    // Function to check if a year is the current year
    func isCurrentYear(_ year: String) -> Bool {
        let currentYear = Calendar.current.component(.year, from: Date())
        return year == String(currentYear)
    }
    
    func fetchBillsList() {
        service.fetchBillsList()
    }
}
