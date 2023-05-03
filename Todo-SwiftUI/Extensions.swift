//
//  Extensions.swift
//  Todo-SwiftUI
//
//  Created by Erdem Tas on 2.05.2023.
//

import SwiftUI

extension Color {
    static let colorArray: [Color] = [.gray, .orange, .black, .purple, .blue, .cyan, .red,.green,.brown,.mint,.indigo,.pink,.yellow,.teal]
    
    static func randomBackgroundColor() -> Color {
       
        return colorArray.randomElement()!
    }
}


extension Date {
    func formatDateLong() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: self)
    }
    
    func formatDateTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .full
        return dateFormatter.string(from: self)
    }
}
