//
//  TodoItem.swift
//  Todo-SwiftUI
//
//  Created by Erdem Tas on 2.05.2023.
//

import SwiftUI

struct TodoItem: View {
    
   @ObservedObject var todo : Todo

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    todo.isCompleted.toggle()
                } label: {
                    Image(systemName : todo.imageName)
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .leading)
                        .foregroundColor(todo.color)
                        .padding()
                    
                    
                }.buttonStyle(BorderlessButtonStyle())

                
                HStack {
                    VStack(alignment: .leading) {
                        Text(todo.title)
                            .font(.title2)
                            .strikethrough(todo.isCompleted)
                        Text(todo.note)
                            .strikethrough(todo.isCompleted)
                        
                    }
                    Spacer()
                    VStack{
                        Text("Deadline: \(todo.deadlineDate.formatDateLong())")
                            .font(.subheadline)
                        Spacer()
                        Text("Created: \(todo.date.formatDateLong())")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    
                }
            }
            
        }
    }
}

struct TodoItem_Previews: PreviewProvider {
    static var previews: some View {
        TodoItem(todo: Todo(title: "Title Example", note: "Note Example",deadlineDate: Date.now))
    }
}
