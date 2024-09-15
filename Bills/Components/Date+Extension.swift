//
//  Date+Extension.swift
//  VivoChallenge
//
//  Created by Guilherme Garcia on 15/09/24.
//

import Foundation

extension Date {
    
    // Function to format Date to "dd/MM"
    func formattedDayMonth() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter.string(from: self)
    }
    
    // Function to format Date to the full month name, e.g., "setembro"
    func formattedMonthName() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR") // Brazilian Portuguese
        formatter.dateFormat = "MMMM" // Full month name
        return formatter.string(from: self).capitalized // Capitalize first letter
    }
}
