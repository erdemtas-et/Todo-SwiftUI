//
//  TodoModel.swift
//  Todo-SwiftUI
//
//  Created by Erdem Tas on 2.05.2023.
//

import SwiftUI

class Todo : ObservableObject, Codable,Identifiable{
    
    var id = UUID().uuidString
    let title : String
    let note : String
    @Published  var isCompleted : Bool = false
    var date : Date = .now
    let deadlineDate : Date
   
   
    var imageName : String {
        self.isCompleted ? "checkmark.circle.fill" : "x.circle"
    }
    
    init(title: String, note: String,deadlineDate: Date) {
        self.title = title
        self.note = note
        self.deadlineDate = deadlineDate
    
    }
    
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        return lhs.id == rhs.id
    }
    
    //MARK: CODABLE
    enum CodingKeys: String, CodingKey {
           case id, title, note, isCompleted, date, deadlineDate
       }
       
       required init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           title = try container.decode(String.self, forKey: .title)
           note = try container.decode(String.self, forKey: .note)
           isCompleted = try container.decode(Bool.self, forKey: .isCompleted)
           date = try container.decode(Date.self, forKey: .date)
           deadlineDate = try container.decode(Date.self, forKey: .deadlineDate)
       }
       
       func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(id, forKey: .id)
           try container.encode(title, forKey: .title)
           try container.encode(note, forKey: .note)
           try container.encode(isCompleted, forKey: .isCompleted)
           try container.encode(date, forKey: .date)
           try container.encode(deadlineDate, forKey: .deadlineDate)
       }
    
   
}
