//
//  BillsService.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 15/09/24.
//

import Foundation
import Combine

class BillsService {
    
    // PassthroughSubject to emit the bills list
    var billsList = PassthroughSubject<[BillsModel], Never>()
    
    private var cancellable = Set<AnyCancellable>()
    
    init(cancellable: Set<AnyCancellable> = Set<AnyCancellable>()) {
        self.cancellable = cancellable
    }
    
    // Function to fetch the bills list and emit mock data for testing
    func fetchBillsList() {
        billsList.send(mockBillsList) // Emit the mock list using 'send'
    }
}
