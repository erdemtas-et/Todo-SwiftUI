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
                        .frame(width: 35, height: 35, alignment: .leading)
                        .foregroundColor(todo.color)
                        
                    
                    
                }.buttonStyle(BorderlessButtonStyle())

                
                HStack {
                    VStack(alignment: .leading) {
                        Text(todo.title)
                            .font(.title3)
                            .fontWeight(.bold)
                            .strikethrough(todo.isCompleted)
                        Text(todo.note)
                            .font(.caption2)
                            .strikethrough(todo.isCompleted)
                        
                    }
                    Spacer()
                    VStack{
                        Text( todo.deadlineDate.formatDateTime())
                            .font(.caption)
 
                    }
                    
                }
            }
        }
    }
}

struct TodoItem_Previews: PreviewProvider {
    static var previews: some View {
        TodoItem(todo: Todo(title: "Title Example", note: "Note Example",deadlineDate: Date.now,color: .green))
    }
}
