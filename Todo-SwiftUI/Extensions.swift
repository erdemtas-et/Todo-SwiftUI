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
    func formatDateTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM HH:mm"
        return dateFormatter.string(from: self)
    }
}
