//
//  TodoModel.swift
//  Todo-SwiftUI
//
//  Created by Erdem Tas on 2.05.2023.
//

import SwiftUI

class Todo : ObservableObject, Identifiable {
    
    let id = UUID()
    let title : String
    let note : String
    @Published var isCompleted : Bool = false
    let date : Date = .now
    let deadlineDate : Date
    var color : Color = Color.randomBackgroundColor()
   
    var imageName : String {
        self.isCompleted ? "checkmark.circle.fill" : "circle.fill"
    }
    
    init(title: String, note: String,deadlineDate: Date) {
        self.title = title
        self.note = note
        self.deadlineDate = deadlineDate
    }
    
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        return lhs.id == rhs.id
    }
}
