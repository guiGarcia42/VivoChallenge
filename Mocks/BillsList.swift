//
//  BillsList.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 15/09/24.
//

import Foundation

// Helper function to convert a string to a date in "dd/MM/yyyy" format
func dateFromString(_ dateString: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    return dateFormatter.date(from: dateString) ?? Date()
}

public let mockBillsList: [BillsModel] = [
    BillsModel(id: 1, date: dateFromString("01/09/2024"), price: 120.50, isPaid: true),
    BillsModel(id: 2, date: dateFromString("15/08/2024"), price: 75.99, isPaid: false),
    BillsModel(id: 3, date: dateFromString("01/07/2024"), price: 150.00, isPaid: true),
    BillsModel(id: 4, date: dateFromString("20/06/2024"), price: 60.00, isPaid: false),
    BillsModel(id: 5, date: dateFromString("05/05/2024"), price: 200.75, isPaid: true),
    BillsModel(id: 6, date: dateFromString("18/04/2024"), price: 180.25, isPaid: false),
    BillsModel(id: 7, date: dateFromString("10/03/2024"), price: 95.60, isPaid: true),
    BillsModel(id: 8, date: dateFromString("01/02/2024"), price: 135.90, isPaid: false),
    BillsModel(id: 9, date: dateFromString("22/01/2024"), price: 120.00, isPaid: true),
    BillsModel(id: 10, date: dateFromString("10/12/2023"), price: 99.99, isPaid: true)
]

public struct BillsModel: Identifiable {
    public let id: Int
    public let date: Date // Change date type to Date
    public let price: Double
    public let isPaid: Bool
}
